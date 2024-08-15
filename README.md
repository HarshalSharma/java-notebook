# java-notebook
Quickly setup Jupyter Notebook to run Java Kernel on docker/podman

# Setup:
Clone the repository and build the container:

```sh
docker build -t java_notebook .
```
or with podman:
```sh
podman build -t java_notebook .
```
# Running the Jupyter Java Notebooks:
```sh
docker run -p 8888:8888 -v C:\Users\YourUserName\Documents\java-notebooks:/home/java-notebooks localhost/java_notebook
```
or with podman:
```sh
podman run -p 8888:8888 -v C:\Users\YourUserName\Documents\java-notebooks:/home/java-notebooks localhost/java_notebook
```
