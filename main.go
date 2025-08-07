package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/ping", func(c echo.Context) error {
		return c.String(http.StatusOK, ping())
	})

	e.Logger.Fatal(e.Start(":1323"))
}

func ping() string {
	return "pong"
}
