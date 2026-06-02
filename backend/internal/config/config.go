package config

import (
	"github.com/joho/godotenv"
	"os"
)

type Config struct {
	Port      string
	JWTSecret string
	DBPath    string
	FilesRoot string
}

func Load() *Config {

	godotenv.Load()

	return &Config{
		Port:      os.Getenv("APP_PORT"),
		JWTSecret: os.Getenv("JWT_SECRET"),
		DBPath:    os.Getenv("DB_PATH"),
		FilesRoot: os.Getenv("FILES_ROOT"),
	}
}
