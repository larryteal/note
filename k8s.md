# K8S
## 环境搭建
### 安装 Docker
  * 安装 Docker
  * 启用 Docker 服务，并设置为开机启动
  * 配置 Docker 源
  ```
  mkdir -p /etc/docker

  tee /etc/docker/daemon.json <<-'EOF'
  {
    "registry-mirrors": ["https://obww7jh1.mirror.aliyuncs.com"]
  }
  EOF

  systemctl daemon-reload

  systemctl restart docker
  ```
### 关闭防火墙
  ```
  systemctl stop firewalld && systemctl disable firewalld
  ```
### 关闭 SElinux
  ```
  setenforce 0
  sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config
  ```
### 关闭交换分区
  ```
  swapoff -a
  sed -i '/ swap / s/^/#/' /etc/fstab
  ``` 
### For CentOS & Redhat
  ```
  cat <<EOF >  /etc/sysctl.d/k8s.conf
  net.bridge.bridge-nf-call-ip6tables = 1
  net.bridge.bridge-nf-call-iptables = 1
  EOF
  sysctl --system
  ```  
### 设置k8s源
  * 使用阿里云镜像
  ```
  cat <<EOF > /etc/yum.repos.d/kubernetes.repo
  [kubernetes]
  name=Kubernetes
  baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
  enabled=1
  gpgcheck=1
  repo_gpgcheck=1
  gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
  EOF
  ``` 
### 安装 kubelet kubeadm kubectl
  ```
  yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
  ```
### 初始化 Master
  * 修改主机名
    ```
    hostnamectl set-hostname newHostName
    ```
  * 修改 /etc/hosts 增加主机名到ip的解析(也可以一次把其他所有节点信息都加进去)
    ```
    192.168.74.129  master1
    ```  
  * 查看 docker 的 cgroup-driver
    ```
    docker info | grep Cgroup
    ## 如果值不是  cgroupfs 需要配置 /etc/default/kubelet 内容 KUBELET_EXTRA_ARGS=--cgroup-driver=<value>
    ```
  * 生成 kubeadm 初始化要用的文件并修改相关配置 （默认值不太适用）
    ```
    ## 可以先修改一波主机名 
    kubeadm config print-default > kubeadm.yml
    ## 修改 imageRepository ，设置为国内源 （如阿里的：registry.aliyuncs.com/google_containers） 
    ## 其他也可以根据需要修改 advertiseAddress，kubernetesVersion ,podSubnet (使用 flannel 网络插件的话要设置 --pod-network-cidr=10.244.0.0/16)
    ```
  * 可以先拉取 kubeadm 初始化所需的镜像
    ```
    kubeadm config images pull --config kubeadm.yml
    ```
  * 执行初始化 
    ```
    kubeadm init --pod-network-cidr=10.244.0.0/16
    ```    
  ```
  ### kubeadm init --image-repository=registry.aliyuncs.com/google_containers
  kubeadm config print-default > kubeadm.yml 
  sed -i "s/imageRepository: .*/imageRepository: registry.aliyuncs.com\/google_containers/g" kubeadm.conf
  sed -i "s/kubernetesVersion: .*/kubernetesVersion: v1.12.2/g" kubeadm.conf
  kubeadm config images pull --config kubeadm.conf
  ```
  ```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  ```
