# microservices 
## 简介
  * 微服务架构是相对于整体应用架构，整体应用架构把所有的功能模块集中在一个服务，微服务架构把不同的功能模块提取成不同的服务，通过服务间的协调合作来实现业务逻辑。
  * 每个服务有自己的数据库，数据库是私有的，只能通过API访问（有点向类的私有属性）
##  API Gateway
  * 微服务依赖API网关。 每个服务负责单一功能，服务可以使用非WEB友好的交互通信协议。
  * 服务的使用者（客户端）需要的协议可能与服务提供者的协议不一致。（e.g: web 客户端使用的HTTP协议）。
  * 如果客户端与服务直接交互，那么服务端的变更可能会导致客户端也要修改。
  * API网关可以提供相对粗粒度的API供客户端消费，减少客户端请求次数（客户端发起一个简单请求，API网关去请求多个服务来响应客户端的请求，同时如果部分不重要的服务请求失败可以提供降级服务）。
  * API 网关是服务的提供者和服务的消费者之间的一座桥梁。
  * API 网关可以提供认证功能，
  * NGINX Plus 、Node.js
  * API 网关请求服务可以使用响应式编程（Rx）
  * API 网关与服务通信可以使用同步（HTTP、 Thrift）或异步方式（消息AMQP、Zeromq）
  * API 网关要有服务发现功能，来确定每个服务的位置（IP & Port）
  * API 网关要对部分服务失败提供降级服务（返回空数据、固定数据、缓存数据等），以增加粗粒度API的可用性。
## 服务间通信
  * RESTFul
  * HTTP 、Thrift、grpc
  * 消息 RabbitMQ、Kafka、ActiveMQ、NSQ
  * 发布/订阅  
##  服务注册发现
### 服务发现 Service Discovery
  * 客户端（Client or API Gateway）发现
  * 服务端（Load Balancer）发现
### 服务注册 Service Registry
  * 服务注册是服务发现的重要组成部分，他是可用服务实例的‘数据库’，他提供一些管理API和查询API，通过管理API可以注册和注销服务，查询API用于服务发现，可用于查询可用服务
  * consul
  * etcd
  * Zookeeper
  * 服务注册分两种，每个微服务自己注册&第三方注册
  * 自己注册要求每个服务实现注册逻辑，发送心跳包
  * 第三方注册（Registrator https://github.com/gliderlabs/registrator）, 需要高可用性  
  *  Kubernetes and Marathon （内置？）
## 事件驱动的分布式数据管理，数据一致性
  * Event Sourcing （事件采购），需要高可用性
  * CQRS
  
## 事务补偿
  * TCC  












