# PiShare

A private home file server with a web UI, accessible from any device on your WiFi.

## What it does when done

- Anyone on your home network opens a browser and goes to `http://raspberrypi:8080`
- They log in with a username + password
- Admins can create users and assign them roles (admin / viewer / editor)
- Each folder can be shared with specific users or roles, with read or write access
- Users can browse, upload, download, and delete files they have access to

## Build Order

### Step 1 — Go basics + project structure
Start here. Set up the Go backend structure and basic HTTP server.

### Step 2 — SQLite + users table + password hashing
Implement the database layer with user authentication.

### Step 3 — JWT authentication API
Build the authentication endpoints with JWT tokens.

### Step 4 — File listing and upload endpoints
Create endpoints for file management operations.

### Step 5 — Permissions system
Implement role-based access control for files and folders.

### Step 6 — Vue login page + file browser UI
Build the frontend login interface and file browser.

### Step 7 — Vue user manager UI
Create the admin interface for managing users and roles.

### Step 8 — Connect everything + run on Pi
Final integration and deployment to a Raspberry Pi.
