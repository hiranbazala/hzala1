First ran below commands as they are the pre requisites for this assignment:

docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0
git clone https://github.com/infracloudio/csvserver.git

**Assignment**

Part I:

Step 1: 
Ran the container image using below command:
docker images
docker run infracloudio/csvserver:latest
docker ps
docker run -it infracloudio/csvserver:latest /bin/bash

This command returned below Error:
`error while reading the file "./inputdata": open ./inputdata: no such file or directory`

As per the error messages,  it is understandable that this coomand requires one file forinputdata, It is returning error because the inputdata file is not available here. So our next step is to generate this inputdata file.

For that I have created gencsv.sh:
$ cat gencsv.sh 
#!/bin/bash
for i in `seq 10`
do
  number=$RANDOM   ## $RANDOM returns a different random integer at each invocation.
  echo $i, $number >> inputFile
done

Ran ./gencsv.sh which creates the inputFile

[node1] (local) root@192.168.0.28 ~/csvserver/solution
$ ls
csvserver  gencsv.sh  inputdata

After that run docker coomand , grep the port on which the application is listening and mapped the port and also added the CSVSERVER_BORDER=Orange as per the requiremnt.
docker run -it -d  -v $(pwd):/csvserver -p 9393:9300 --env CSVSERVER_BORDER=Orange infracloudio/csvserver:latest

Output:
$ docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                    NAMES
f742a0a011bb   infracloudio/csvserver:latest   "/csvserver/csvserver"   25 seconds ago   Up 21 seconds   0.0.0.0:9393->9300/tcp   focused_panini

Now the docker image is running  without any errors.

Part II:

Created the docker-compose.yaml , saved the changes in git repo.

Command : docker-compose up

Part III

Added Prometheus container in docker-compose.yaml , I have commited the same in solution directory.


