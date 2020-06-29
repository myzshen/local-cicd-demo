IMAGE_NAME="jenkins-master"
CONTAINER_NAME="jenkins-master"
MVN_PROJECT="mvn-test"

run:
	cd scripts ; \
	./clone.sh ; \
	./build.sh ; \
	./run.sh ; \
	cd -

clean:
	docker stop $(IMAGE_NAME) ; \
	docker rm $(CONTAINER_NAME) ; \
	docker rmi $(IMAGE_NAME) ; \
	rm -rf ../$(MVN_PROJECT)

