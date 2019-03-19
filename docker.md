# docker

## 安装docker
### centos 7
#### 安装
  * 安装工具
  ```
  $ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
  ```
  * 安装docker源
  ```
  $ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
  ```
    * 启用或关闭源
    ```
    $ sudo yum-config-manager --enable docker-ce-nightly
    $ sudo yum-config-manager --enable docker-ce-test
    $ sudo yum-config-manager --disable docker-ce-nightly
    ```
  * 安装
  ```
  sudo yum install docker-ce docker-ce-cli containerd.io
  ```
  * 其他
    * docker 安装后服务是没有启动的
    ```
    sudo systemctl start docker # 启动
    sudo systemctl enable docker # 开机自启动
    ```
    * docker 的用户组会创建但是默认没有添加任何用户
      * 添加用户到docker用户组，这样就可以不用root用户执行docker命令了（用户需重新登陆）
      ```
      sudo usermod -aG docker your-user
      ```
    * 下载image并以此创建container运行
    ```
    sudo docker run hello-world
    ```
    * 顺序列出可用的版本
    ```
    yum list docker-ce --showduplicates | sort -r
    ```
    * 安装指定版本的docker
    ```
    sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
    ```
      * VERSION_STRING 是:与-之间的值（yum list docker-ce --showduplicates | sort -r）
      ```
      例如： 3:18.09.3-3.el7 -------> 18.09.3
            18.06.1.ce-3.el7 -------> 18.06.1.ce
      ```
#### 卸载
  * 卸载软件包
  ```
  $ sudo yum remove docker-ce
  ```
  * 删除相关文件(Images, containers, volumes, or customized configuration files)
  ```
  $ sudo rm -rf /var/lib/docker
  ```
## 起步
### 第一部分
  * 查看docker版本信息
  ```
  docker --version
  ```
  * 查看docker详细信息
  ```
  docker version
  docker info
  ```
  * 检测docker安装运行是否正常
  ```
  docker run hello-world
  ```
  * 列出已经下载的image（镜像）文件
  ```
  docker image ls
  ```
  * 列出已经创建的container
  ```
  docker container ls --all
  ```
  * 列出正在运行的container
  ```
  docker container ls
  ```
  * 列出停止运行的container
  ```
  docker container ls -aq
  ```
  * 列出docker帮助信息
  ```
  docker
  docker --help
  ```
### 第二部分
  * 编写 Dockerfile 文件
  ```
  # Use an official Python runtime as a parent image
  FROM python:2.7-slim

  # Set the working directory to /app
  WORKDIR /app

  # Copy the current directory contents into the container at /app
  COPY . /app

  # Install any needed packages specified in requirements.txt
  RUN pip install --trusted-host pypi.python.org -r requirements.txt

  # Make port 80 available to the world outside this container
  EXPOSE 80

  # Define environment variable
  ENV NAME World

  # Run app.py when the container launches
  CMD ["python", "app.py"]
  ```
  * 依据Dockerfile创建image
  ```
  docker build --tag=imageName:version .
  # --tag 简写形式是 -t
  # . 是指Dockerfile文件在当前目录
  ```
  * 运行app
  ```
  docker run -p 4000:80 imageName
  ```
  * 停止运行
  ```
  CTRL + C
  docker container stop <Container NAME or ID>
  ```
  * 一些命令
  ```
  docker build -t friendlyhello .  # Create image using this directory's Dockerfile
  docker run -p 4000:80 friendlyhello  # Run "friendlyname" mapping port 4000 to 80
  docker run -d -p 4000:80 friendlyhello         # Same thing, but in detached mode
  docker container ls                                # List all running containers
  docker container ls -a             # List all containers, even those not running
  docker container stop <hash>           # Gracefully stop the specified container
  docker container kill <hash>         # Force shutdown of the specified container
  docker container rm <hash>        # Remove specified container from this machine
  docker container rm $(docker container ls -a -q)         # Remove all containers
  docker image ls -a                             # List all images on this machine
  docker image rm <image id>            # Remove specified image from this machine
  docker image rm $(docker image ls -a -q)   # Remove all images from this machine
  docker login             # Log in this CLI session using your Docker credentials
  docker tag <image> username/repository:tag  # Tag <image> for upload to registry
  docker push username/repository:tag            # Upload tagged image to registry
  docker run username/repository:tag                   # Run image from a registry
  ```
### 第三部分
  * 服务
  * 编写 docker-compose.yml 文件
  ```
  version: "3"
  services:
    web:
      # replace username/repo:tag with your name and image details
      image: username/repo:tag
      deploy:
        replicas: 5
        resources:
          limits:
            cpus: "0.1"
            memory: 50M
        restart_policy:
          condition: on-failure
      ports:
        - "4000:80"
      networks:
        - webnet
  networks:
    webnet:  
  ```
  ```
  * 从指定的源拉取镜像
  * 运行5个镜像副本，并设置每个的cpu和内存资源
  * 设置容器重启条件（一个失败即重启）
  * 设置端口映射
  * 指示Web容器通过称为webnet的负载平衡网络共享端口80
  * 使用默认设置定义Webnet网络
  ```
  * 启用服务
  ```
  docker swarm init
  docker stack deploy -c docker-compose.yml stackName
  ```
  * 查看信息
  ```
  docker service ls
  docker stack ls
  docker stack service stackName
  docker service ps stackName_web
  docker container ls -q
  ```
  * 可以通过更改docker-compose.yml中的副本值来保存更改，并重新运行docker stack deploy命令来扩展应用程序
  ```
  docker stack deploy -c docker-compose.yml stackName
  ```
  * 停止服务
  ```
  docker stack rm stackName
  docker swarm level --force
  ```
  * 命令
  ```
  docker stack ls                                            # List stacks or apps
  docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
  docker service ls                 # List running services associated with an app
  docker service ps <service>                  # List tasks associated with an app
  docker inspect <task or container>                   # Inspect task or container
  docker container ls -q                                      # List container IDs
  docker stack rm <appname>                             # Tear down an application
  docker swarm leave --force      # Take down a single node swarm from the manager
  ```
### 第四部分
  * swarm 集群
  * 安装 VirtualBox （被 docker-machine 依赖）
  * 安装 docker-machine (用于创建虚拟机)
  ```
  base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine
  ```  
