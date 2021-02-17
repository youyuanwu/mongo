IMG_NAME = mongov-tester

start-db:
	docker-compose up -d

docker-tester:
	docker build -t ${IMG_NAME}:latest -f Dockerfile .

test:
	docker run -it --rm \
		--network mongo_mongov \
		-v ${PWD}:/repo \
		-w /repo \
		${IMG_NAME}:latest v -stats -cg -showcc test mongo_test.v

bash:
	docker run -it --rm \
		--network mongo_mongov \
		-v ${PWD}:/repo \
		-w /repo \
		${IMG_NAME}:latest bash