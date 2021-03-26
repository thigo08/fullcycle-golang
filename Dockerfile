FROM golang:alpine3.13 AS builder
WORKDIR /go/src/app
COPY . .
RUN go mod init example.com/main
RUN go build -o main . 

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app .
CMD ["/go/src/app/main"]