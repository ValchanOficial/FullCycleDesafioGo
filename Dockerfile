FROM golang:1.20 AS builder

WORKDIR /app

COPY main.go .

RUN go build main.go && chmod +x main


FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]