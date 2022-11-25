# build stage
FROM golang as builder
WORKDIR /server
COPY go.mod /server/
COPY go.sum /server/
RUN go mod download
COPY . .
RUN go build

# run stage

#FROM alpine:latest
#COPY --from=builder server/testConcepts /server/
EXPOSE 8081
ENTRYPOINT ["/server/testConcepts"]
