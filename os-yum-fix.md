# 升级curl 后yum upate 报错
  * /usr/lib64/python2.7/site-packages/pycurl.so: undefined symbol: CRYPTO_num_locks
## 临时解决方法
  ```bash
  cd /usr/local/lib
  mv libcurl.so.4 libcurl.so.4.bak
  ```
## 辅助查询命令
  * ldconfig -p -N -X | grep curl
    ```
    libcurl.so.4 (libc6,x86-64) => /usr/local/lib/libcurl.so.4
	  libcurl.so.4 (libc6,x86-64) => /lib64/libcurl.so.4
	  libcurl.so (libc6,x86-64) => /usr/local/lib/libcurl.so
    ```
  * ldd /usr/lib64/python2.7/site-packages/pycurl.so
    ```
    linux-vdso.so.1 (0x00007fffc4189000)
    libcurl.so.4 => /usr/local/lib/libcurl.so.4 (0x00007f617c68b000)
    libpython2.7.so.1.0 => /lib64/libpython2.7.so.1.0 (0x00007f617c2bf000)
    libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f617c0a1000)
    libc.so.6 => /lib64/libc.so.6 (0x00007f617bcf5000)
    libnghttp2.so.14 => /usr/local/lib/libnghttp2.so.14 (0x00007f617bace000)
    libssl.so.1.1 => /opt/openssl/lib/libssl.so.1.1 (0x00007f617b83d000)
    libcrypto.so.1.1 => /opt/openssl/lib/libcrypto.so.1.1 (0x00007f617b358000)
    libz.so.1 => /lib64/libz.so.1 (0x00007f617b142000)
    libdl.so.2 => /lib64/libdl.so.2 (0x00007f617af3e000)
    libutil.so.1 => /lib64/libutil.so.1 (0x00007f617ad3b000)
    libm.so.6 => /lib64/libm.so.6 (0x00007f617aa39000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f617cb11000)    
    ```    