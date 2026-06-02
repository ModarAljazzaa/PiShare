# ==========================================
# STAGE 1: Build the Vue Frontend
# ==========================================
FROM node:20-alpine AS frontend-builder
WORKDIR /app/frontend

# Install dependencies
COPY frontend/package*.json ./
RUN npm install

# Copy source and compile to static assets
COPY frontend/ ./
RUN npm run build

# ==========================================
# STAGE 2: Build the Go Backend
# ==========================================
FROM golang:1.22-alpine AS backend-builder
WORKDIR /app/backend

# Install dependencies
COPY backend/go.mod backend/go.sum ./
RUN go mod download

# Copy source and build the backend binary
COPY backend/ .
RUN apk add --no-cache gcc musl-dev sqlite-dev \
 && CGO_ENABLED=1 GOOS=linux go build -o pishare ./cmd/server

# ==========================================
# STAGE 3: Final Lightweight Runner
# ==========================================
FROM alpine:latest
RUN apk --no-cache add ca-certificates tzdata sqlite-libs
WORKDIR /root/

# Copy the compiled Go binary from Stage 2
COPY --from=backend-builder /app/backend/pishare .

# Copy the compiled Vue static files from Stage 1 into a 'dist' folder next to the binary
COPY --from=frontend-builder /app/frontend/dist ./dist

# Document the port
EXPOSE 8080

# Environment defaults
ENV DATA_DIR=/data
ENV GIN_MODE=release

# Run the app
CMD ["./file-manager"]