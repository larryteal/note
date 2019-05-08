# 网络

## 局域网
  * 以太网
  * Token ring
  * 
### 以太网
  * 以太网 10Mbps
  * 快速以太网 100Mbps
  * 高速以太网 1Gbps
#### 连接线
  * 光纤
    - 单模光纤 （激光）
    - 多模光纤 （LED光）
  * 双绞线
    - 直连线 （两端同为 568A）
    - 交叉线  (一端为 568A 一端为 568B)
    - 一般同种设备间使用交叉线，不同设备间使用直连线
      * PC 连 PC 交叉线
      * PC 连 交换机 直连线
      * PC 连 路由器 交叉线 （网卡对网卡）
  * 同轴电缆
#### MAC 地址
  * 以太网卡根据 MAC 地址判断是否接受数据或者丢弃数据
#### 中继器 集线器  网桥 交换机 路由器
  * 中继器（已淘汰） 早期同轴电缆连接的以太网，用于延长网络传输距离
  * 集线器 双绞线连接的以太网，用于延长网络传输距离
  * 中继器与集线器类似，都工作在OSI网络模型的第一层 
  * 网桥（已淘汰） 用同轴电缆相连，用于延长网络传输距离，他工作在OSI网络模型的第二层，因此可以根据MAC地址判断数据包，与中继器相比降低了网络冲突
  * 交换机 使用双绞线连接，工作在OSI网络模型的的第二层，类似网桥，他可以根据MAC地址判断数据包