A sample nodejs application that prints "Hello World Executing Task2 from Docker container"

Below are the steps 

In this directory execute the docker command as below to build the docker images

docker build -t <name of the docker images ex: hello-world> .

Run the container and bind the port 8080 with local host from the above built docker image

docker run -p 8080:8080 -d <name of the docker images ex: hello-world>

To validate

docker images                       //to check the new images 
docker ps                           //to check the running contaners
docker logs <container ID>          //to check the logs of the container
curl http://localhost:8080          //to access the docker application that we have created
docker exec -it <containerID> sh    //to enter into the docker container