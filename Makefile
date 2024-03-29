build:
	protoc -I. --go_out=plugins=micro:. \
      --micro_out=plugins=micro:. proto/vessel/vessel.proto
	docker build -t shippy-service-vessel .

run:
	docker run -p 50052:50051 -e MICRO_SERVER_ADDRESS=:50051 shippy-service-vessel