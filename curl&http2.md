# 使 curl 支持 http2 

## 安装新版openssl 
  * 安装位置 /opt/openssl
  ```bash
    mkdir /var/tmp
    cd /var/tmp
    wget https://www.openssl.org/source/openssl-1.0.2-latest.tar.gz
    tar -zxf openssl-1.0.2-latest.tar.gz
    cd openssl-1.0.2l
    mkdir /opt/openssl
    ./config --prefix=/opt/openssl
    make
    make test
    make install  
  ```
## 安装 nghttp2
  ```bash
    git clone https://github.com/tatsuhiro-t/nghttp2.git
    cd nghttp2
    autoreconf -i
    automake
    autoconf
    ./configure
    make
    make install
    echo '/usr/local/lib' > /etc/ld.so.conf.d/custom-libs.conf
    ldconfig
    ldconfig -p| grep libnghttp2  
  ```

## 升级安装 curl , 增加 http2 和新版的 openssl
  ```bash
    cd /var/tmp
    git clone https://github.com/bagder/curl.git
    cd curl
    ./buildconf
    ./configure --with-ssl=/opt/openssl --with-nghttp2=/usr/local 
    make
    make install
  ```
## 测试 http2
  ```bash
  curl --http2 -I https://nghttp2.org/
  ```  
## 报错修复 
  * error while loading shared libraries: libssl.so.1.1: cannot open shared object file: No such file or directory
  ```bash
  echo '/opt/openssl/lib' > /etc/ld.so.conf.d/custom-libs.conf
  ldconfig
  ```    

## 参考
  * http://mor-pah.net/2017/06/21/installing-curl-with-http2-support-on-centos-7-self-contained/