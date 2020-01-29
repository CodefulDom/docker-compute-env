FROM golang:1.7.3
WORKDIR /go/src/github.com/codefuldom/docker-compute-env 
RUN go get -d -v golang.org/x/net/html  
COPY main.go .


FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 github.com/codefuldom/docker-compute-env/main.go .
CMD ["go", "run" "main.go"]  