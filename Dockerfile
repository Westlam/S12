# Используем официальный образ Golang
FROM golang:1.23.4
# Устанавливаем рабочую директорию
WORKDIR /app
# Копируем go.mod и go.sum для кэширования зависимостей
COPY go.mod go.sum ./
# Загружаем зависимости
RUN go mod download
# Копируем остальные файлы приложения
COPY . .
# Компилируем приложение
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app .
# Указываем команду для запуска приложения
CMD ["/my_app"]
