First ran below commands as thyy are the pre requisites for this assignment:

docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0
git clone https://github.com/infracloudio/csvserver.git

**Assignment Part I:**

Step 1: 
Ran the container image using below command:
docker run infracloudio/csvserver:latest
This command returned below Error:
`error while reading the file "./inputdata": open ./inputdata: no such file or directory`

As per this  it is understandable that this coomand requires one file named inputdata, It is returning error because the inputdata file is not available here. So our next step is to generate this inputdata file.

For that I have created gencsv.sh:
$ cat gencsv.sh 
#!/bin/bash
for i in `seq 10`
do
  number=$RANDOM   ## $RANDOM returns a different random integer at each invocation.
  echo $i, $number >> inputFile
done

Ran ./gencsv.sh 

[node1] (local) root@192.168.0.23 ~/csvserver/solution
$ ls
csvserver  gencsv.sh  inputdata

docker run -it -d  -v $(pwd):/csvserver -p 9393:9300 --env CSVSERVER_BORDER=Orange infracloudio/csvserver:latest

Output:
$ docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                    NAMES
f742a0a011bb   infracloudio/csvserver:latest   "/csvserver/csvserver"   25 seconds ago   Up 21 seconds   0.0.0.0:9393->9300/tcp   focused_panini



