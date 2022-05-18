FROM golang:1.16-alpine
# Making a folder where we run our commands
WORKDIR /app
# importing all go modules
COPY go.mod ./
# COPY go.sum ./
RUN go mod download

# Coping the Golang code of project 
COPY *.go ./
# build our Go-server
RUN go build -o golang-server .

EXPOSE 8080

CMD [ "/app/golang-server" ]