# Dockerfile.production

# first stage, where i will install dependencies & build app.
FROM registry.semaphoreci.com/golang:1.18 as builder

ENV APP_HOME /go/src/goviolin

WORKDIR "$APP_HOME"
COPY . .

RUN go mod download
RUN go mod verify
RUN go build -o goviolin

# 2nd stage, where i will run the services.
FROM registry.semaphoreci.com/golang:1.18

ENV APP_HOME /go/src/goviolin
RUN mkdir -p "$APP_HOME"
WORKDIR "$APP_HOME"

COPY . .
COPY --from=builder "$APP_HOME"/goviolin $APP_HOME

EXPOSE 8080
CMD ["./goviolin"]
