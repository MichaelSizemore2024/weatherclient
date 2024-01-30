.PHONY: all clean

# Add the export command to update PATH
export PATH := $(PATH):$(shell go env GOPATH)/bin

all: generic_proto weather_proto

weather_proto:
	python3 -m grpc_tools.protoc --proto_path=./proto --python_out=common --grpc_python_out=common proto/weather.proto

generic_proto:
	python3 -m grpc_tools.protoc --proto_path=./proto --python_out=common --grpc_python_out=common proto/generic.proto

clean:
	rm -rf common/*