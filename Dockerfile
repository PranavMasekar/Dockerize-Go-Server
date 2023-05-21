FROM golang:1.16-alpine AS builder

RUN apk add --no-cache git

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o golang-server .

FROM alpine:latest

RUN apk add --no-cache ca-certificates

COPY --from=builder /app/golang-server /app/golang-server

EXPOSE 8080

CMD [ "/app/golang-server" ]