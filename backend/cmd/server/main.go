package main

import (
	"github.com/ModarAljazzaa/PiShare/internal/config"
	"github.com/gin-gonic/gin"
)

func main() {
	cfg := config.Load()

	router := gin.Default()

	router.GET("/health", func(ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"status": "Okay",
		})
	})

	router.Run(":" + cfg.Port)

}
