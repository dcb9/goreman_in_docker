.PHONY: image

img_tag = "dcb9/testgoreman"
container_name = "dcb9testgoreman"

image:
	GOOS=linux GOARCH=amd64 go build -o test_signal_linux_amd64 signal.go
	docker build . -t $(img_tag)
	rm -rf test_signal_linux_amd64

run:
	docker run --rm \
	  --name $(container_name) \
	  $(img_tag)

stop:
	docker stop $(container_name)

exec:
	docker exec -it $(container_name) sh

logs:
	docker logs --tail 100 -f $(container_name)
