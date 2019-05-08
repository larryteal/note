# mongoDB 使用 v3.6.4

## 链接登陆数据库
  * 确保mongod 服务启动
  * mongo 命令链接
  * 权限认证
  ```bash
  systemctl status mongod
  systemctl restart mongod

  mongo
  >use admin
  >db.auth('root', '123456')
  >show dbs

  ```

## 添加管理员
```mongo
  use admin
  db.createUser({
    user:'user name',
    pwd:'password',
    roles:[{ role:'权限',db:'admin' }]
  })
```
* https://docs.mongodb.com/manual/core/security-built-in-roles/
* 先添加管理员。然后再添加其他库的用户。
```mongo
  use testDB
  db.createUser({
    user:'user name',
    pwd:'password',
    roles:[{ role:'权限',db:'testDB' }]
  })
```
## 配置mongoDB认证
* 修改/etc/mongod.conf,设置security.authorization 为 enabled
```bash
# security
security:
  authorization: enabled
```
* 不同版本的mongoDB 设置可能会有不同。
* 注意格式，authorization: 后面有一个空格，没有空格会出错无法启动！！
## 修改mongoDB的数据存储位置方法
* 修改配置文件/etc/mongo.conf
```bash
storage:
  dbPath: /data/mongo
```  
* 关闭mongod服务
```bash
sudo systemctl stop mongod
```
* 把mongodb原来的旧数据复制到新文件夹里
```bash
sudo cp -ra /var/lib/mongo   /data/mongo
```
## 卸载mongodb
  * 卸载相关包
  ```bash
  sudo yum erase $(rpm -qa | grep mongodb-org)
  ```
  * 删除数据文件及日志文件
  ```bash
  sudo rm -r /var/log/mongodb
  sudo rm -r /var/lib/mongo
  ```
## 数据库备份&导入
### 备份导出数据库
  * mongodump -h 127.0.0.1 --port 27017 -u uname -p upwd -d DBName
### 导入数据库
  * mongorestore -h IP --port 端口 -u 用户名 -p 密码 -d 数据库 --drop 文件存在路径

## 阅读笔记
（来自菜鸟教程）
### 数据库也通过名字来标识。数据库名可以是满足以下条件的任意UTF-8字符串。

* 不能是空字符串（"")。
* 不得含有' '（空格)、.、$、/、\和\0 (空字符)。
* 应全部小写。
* 最多64字节。
### 有一些数据库名是保留的，可以直接访问这些有特殊作用的数据库。

* admin： 从权限的角度来看，这是"root"数据库。要是将一个用户添加到这个数据库，这个用户自动继承所有数据库的权限。一些特定的服务器端命令也只能从这个数据库运行，比如列出所有的数据库或者关闭服务器。
* local: 这个数据永远不会被复制，可以用来存储限于本地单台服务器的任意集合
* config: 当Mongo用于分片设置时，config数据库在内部使用，用于保存分片的相关信息。
### 文档键命名规范：

* 键不能含有\0 (空字符)。这个字符用来表示键的结尾。
* .和$有特别的意义，只有在特定环境下才能使用。
* 以下划线"_"开头的键是保留的(不是严格要求的)。

### 合法的集合名
* 集合名不能是空字符串""。
* 集合名不能含有\0字符（空字符)，这个字符表示集合名的结尾。
* 集合名不能以"system."开头，这是为系统集合保留的前缀。
* 用户创建的集合名字不能含有保留字符。有些驱动程序的确支持在集合名里面包含，这是因为某些系统生成的集合中包含该字符。除非你要访问这种系统创建的集合，否则千万不要在名字里出现$。　

### capped collections
Capped collections 就是固定大小的collection。

它有很高的性能以及队列过期的特性(过期按照插入的顺序). 有点和 "RRD" 概念类似。

Capped collections是高性能自动的维护对象的插入顺序。它非常适合类似记录日志的功能 和标准的collection不同，你必须要显式的创建一个capped collection， 指定一个collection的大小，单位是字节。collection的数据存储空间值提前分配的。

要注意的是指定的存储大小包含了数据库的头信息。
```bash
db.createCollection("mycoll", {capped:true, size:100000})
```
* 在capped collection中，你能添加新的对象。
* 能进行更新，然而，对象不会增加存储空间。如果增加，更新就会失败 。
* 数据库不允许进行删除。使用drop()方法删除collection所有的行。
* 注意: 删除之后，你必须显式的重新创建这个collection。
* 在32bit机器中，capped collection最大存储为1e9( 1X109)个字节
### MongoDB 会自动创建数据库和集合，所以使用前我们不需要手动去创建。

### mongodb 常用数据类型

* String	字符串。存储数据常用的数据类型。在 MongoDB 中，UTF-8 编码的字符串才是合法的。
* Integer	整型数值。用于存储数值。根据你所采用的服务器，可分为 32 位或 64 位。
* Boolean	布尔值。用于存储布尔值（真/假）。
* Double	双精度浮点值。用于存储浮点值。
* Min/Max keys	将一个值与 BSON（二进制的 JSON）元素的最低值和最高值相对比。
* Array	用于将数组或列表或多个值存储为一个键。
* Timestamp	时间戳。记录文档修改或添加的具体时间。
* Object	用于内嵌文档。
* Null	用于创建空值。
* Symbol	符号。该数据类型基本上等同于字符串类型，但不同的是，它一般用于采用特殊符号类型的语言。
* Date	日期时间。用 UNIX 时间格式来存储当前日期或时间。你可以指定自己的日期时间：创建 Date 对象，传入年月日信息。
* Object ID	对象 ID。用于创建文档的 ID。
* Binary Data	二进制数据。用于存储二进制数据。
* Code	代码类型。用于在文档中存储 JavaScript 代码。
* Regular expression	正则表达式类型。用于存储正则表达式。

### MongoDB 中存储的文档必须有一个 _id 键。这个键的值可以是任何类型的，默认是个 ObjectId 对象

* 由于 ObjectId 中保存了创建的时间戳，所以你不需要为你的文档保存时间戳字段，你可以通过 getTimestamp 函数来获取文档的创建时间:

```js
> var newObject = ObjectId()
> newObject.getTimestamp()
ISODate("2017-11-25T07:21:10Z")
```
* ObjectId 转为字符串
```js
> newObject.str
5a1919e63df83ce79df8b38f
```
### mongodb 标准 URI 连接语法：
mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]

### 创建数据库
* 连接数据库后直接输入 use dbName 命令即可
  eg： use users  创建users 数据库
* 创建的数据库只有在插入输入后才能看到，空的数据库不显示
* show dbs 命令可以查看数据库  

### 删除当前数据库
```js
db.dropDatabase()
```
### db 命令查看当前使用的数据库
```js
db
```
### 创建集和
```js
db.createCollection(name,options)
```
* name: 要创建的集合名称
* options: 可选参数, 指定有关内存大小及索引的选项
options 
* capped	布尔	（可选）如果为 true，则创建固定集合。固定集合是指有着固定大小的集合，当达到最大值时，它会自动覆盖最早的文档。
* 当该值为 true 时，必须指定 size 参数。
* autoIndexId	布尔	（可选）如为 true，自动在 _id 字段创建索引。默认为 false。
* size	数值	（可选）为固定集合指定一个最大值（以字节计）。如果 capped 为 true，也需要指定该字段。
* max	数值	（可选）指定固定集合中包含文档的最大数量。

### 显示集和
```js
show collections
```
### 删除集和
```js
db.collectionName.drop()
//eg： db.userinfo.drop()
```
### 插入文档
```js
db.collectionName.insert(ducument)
//eg: db.userinfo.insert({name:'Herry',addr:'人民路100号'})
```
### 跟新文档
```js
db.collectionName.update(
  <query>,
  <update>,
  {
    upsert: <boolean>,
    multi: <boolean>,
    writeConcern: <document>
  }
)
// eg：
// db.col.update({'title':'MongoDB 教程'},{$set:{'title':'MongoDB'}})
// db.col.update({'title':'MongoDB 教程'},{$set:{'title':'MongoDB'}},{multi:true})
```
参数说明
* query : update的查询条件，类似sql update查询内where后面的。
* update : update的对象和一些更新的操作符（如$,$inc...）等，也可以理解为sql update查询内set后面的
* upsert : 可选，这个参数的意思是，如果不存在update的记录，是否插入objNew,true为插入，默认是false，不插入。
* multi : 可选，mongodb 默认是false,只更新找到的第一条记录，如果这个参数为true,就把按条件查出来多条记录全部更新。
* writeConcern :可选，抛出异常的级别。
### save() 方法通过传入的文档来替换已有文档
```js
db.collectionName.save(
  <document>,
  {
    writeConcern: <document>
  }
)
```
参数说明
* document : 文档数据。
* writeConcern :可选，抛出异常的级别。

### 删除文档
```js
db.collectionName.remove(
  <query>
  {
    justOne: <boolean>,
    writeConcern: <document>
  }
)
// eg: db.userinfo.remove({name:'Herry'})
```
参数说明

* query :（可选）删除的文档的条件。
* justOne : （可选）如果设为 true 或 1，则只删除一个文档。
* writeConcern :（可选）抛出异常的级别。
### 查询文档
```js
db.collectionName.find(query,projection)
```
参数说明
* query ：可选，使用查询操作符指定查询条件
* projection ：可选，使用投影操作符指定返回的键。查询时返回文档中所有键值， 只需省略该参数即可（默认省略）。

### pretty() 方法以格式化的方式来显示所有文档。
```js
db.collectonName.find().pretty()
```
### 除了 find() 方法之外，还有一个 findOne() 方法，它只返回一个文档。

### 查询条件
* 等于	{<key>:<value>}	db.col.find({"by":"菜鸟教程"}).pretty()	where by = '菜鸟教程'
* 小于	{<key>:{$lt:<value>}}	db.col.find({"likes":{$lt:50}}).pretty()	where likes < 50
* 小于或等于	{<key>:{$lte:<value>}}	db.col.find({"likes":{$lte:50}}).pretty()	where likes <= 50
* 大于	{<key>:{$gt:<value>}}	db.col.find({"likes":{$gt:50}}).pretty()	where likes > 50
* 大于或等于	{<key>:{$gte:<value>}}	db.col.find({"likes":{$gte:50}}).pretty()	where likes >= 50
* 不等于	{<key>:{$ne:<value>}}	db.col.find({"likes":{$ne:50}}).pretty()	where likes != 50
#### MongoDB AND 条件
MongoDB 的 find() 方法可以传入多个键(key)，每个键(key)以逗号隔开，即常规 SQL 的 AND 条件。
```js
db.col.find({key1:value1, key2:value2}).pretty()
```
#### MongoDB OR 条件
MongoDB OR 条件语句使用了关键字 $or,语法格式如下：
```js
>db.col.find(
   {
      $or: [
         {key1: value1}, {key2:value2}
      ]
   }
).pretty()
// eg: db.col.find({$or:[{"by":"菜鸟教程"},{"title": "MongoDB 教程"}]}).pretty()
```
#### AND 和 OR 联合使用
* db.col.find({"likes": {$gt:50}, $or: [{"by": "菜鸟教程"},{"title": "MongoDB 教程"}]}).pretty()

### 条件操作符
* (>) 大于 - $gt
* (<) 小于 - $lt
* (>=) 大于等于 - $gte
* (<= ) 小于等于 - $lte
$gt -------- greater than  >
$gte --------- gt equal  >=
$lt -------- less than  <
$lte --------- lt equal  <=
$ne ----------- not equal  !=
$eq  --------  equal  =

#### MongoDB 使用 (<) 和 (>) 查询 - $lt 和 $gt
db.col.find({likes : {$lt :200, $gt : 100}})

### MongoDB $type 操作符

### MongoDB Limit() 方法,limit()方法接受一个数字参数，该参数指定从MongoDB中读取的记录条数。
```js
db.COLLECTION_NAME.find().limit(NUMBER)
```
### MongoDB Skip() 方法,skip方法同样接受一个数字参数作为跳过的记录条数。skip()方法默认参数为 0 。
```js
db.COLLECTION_NAME.find().limit(NUMBER).skip(NUMBER)
```
### MongoDB 排序,sort()方法,sort()方法可以通过参数指定排序的字段，并使用 1 和 -1 来指定排序的方式，其中 1 为升序排列，而-1是用于降序排列。
```js
db.COLLECTION_NAME.find().sort({KEY:1})
//eg: db.col.find({},{"title":1,_id:0}).sort({"likes":-1})
```
### MongoDB 索引,使用 ensureIndex() 方法来创建索引。
```js
db.COLLECTION_NAME.ensureIndex({KEY:1})
//语法中 Key 值为你要创建的索引字段，1为指定按升序创建索引，如果你想按降序来创建索引指定为-1即可。
//eg:  
// db.col.ensureIndex({"title":1})
// db.col.ensureIndex({"title":1,"description":-1})
```
#### ensureIndex() 接收可选参数

* background	Boolean	建索引过程会阻塞其它数据库操作，background可指定以后台方式创建索引，即增加 "background" 可选参数。 "background" 默认值为false。
* unique	Boolean	建立的索引是否唯一。指定为true创建唯一索引。默认值为false.
* name	string	索引的名称。如果未指定，MongoDB的通过连接索引的字段名和排序顺序生成一个索引名称。
* dropDups	Boolean	在建立唯一索引时是否删除重复记录,指定 true 创建唯一索引。默认值为 false.
* sparse	Boolean	对文档中不存在的字段数据不启用索引；这个参数需要特别注意，如果设置为true的话，在索引字段中不会查询出不包含对应字段的文档.。默认值为 false.
* expireAfterSeconds	integer	指定一个以秒为单位的数值，完成 TTL设定，设定集合的生存时间。v	index version	索引的版本号。默认的索引版本取决于mongod创建索引时运行的版本。
* weights	document	索引权重值，数值在 1 到 99,999 之间，表示该索引相对于其他索引字段的得分权重。
* default_language	string	对于文本索引，该参数决定了停用词及词干和词器的规则的列表。 默认为英语
* language_override	string	对于文本索引，该参数指定了包含在文档中的字段名，语言覆盖默认的language，默认值为 language.
```js
db.values.ensureIndex({open: 1, close: 1}, {background: true})
```
### MongoDB 聚合,MongoDB中聚合(aggregate)主要用于处理数据(诸如统计平均值,求和等)，并返回计算后的数据结果。有点类似sql语句中的 count(*)。
```js
db.COLLECTION_NAME.aggregate(AGGREGATE_OPERATION)
//eg: db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : 1}}}])
```
#### 聚合的表达式:

* $sum	计算总和。	db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : "$likes"}}}])
* $avg	计算平均值	db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$avg : "$likes"}}}])
* $min	获取集合中所有文档对应值得最小值。	db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$min : "$likes"}}}])
* $max	获取集合中所有文档对应值得最大值。	db.mycol.aggregate([{$group : {_id : "$by_user", num_tutorial : {$max : "$likes"}}}])
* $push	在结果文档中插入值到一个数组中。	db.mycol.aggregate([{$group : {_id : "$by_user", url : {$push: "$url"}}}])
* $addToSet	在结果文档中插入值到一个数组中，但不创建副本。	db.mycol.aggregate([{$group : {_id : "$by_user", url : {$addToSet : "$url"}}}])
* $first	根据资源文档的排序获取第一个文档数据。	db.mycol.aggregate([{$group : {_id : "$by_user", first_url : {$first : "$url"}}}])
* $last	根据资源文档的排序获取最后一个文档数据	db.mycol.aggregate([{$group : {_id : "$by_user", last_url : {$last : "$url"}}}])

#### 聚合中的管道操作
* $project：修改输入文档的结构。可以用来重命名、增加或删除域，也可以用于创建计算结果以及嵌套文档。
* $match：用于过滤数据，只输出符合条件的文档。$match使用MongoDB的标准查询操作。
* $limit：用来限制MongoDB聚合管道返回的文档数。
* $skip：在聚合管道中跳过指定数量的文档，并返回余下的文档。
* $unwind：将文档中的某一个数组类型字段拆分成多条，每条包含数组中的一个值。
* $group：将集合中的文档分组，可用于统计结果。
* $sort：将输入文档排序后输出。
* $geoNear：输出接近某一地理位置的有序文档。
```js
db.article.aggregate(
    { $project : {
        title : 1 ,
        author : 1 ,
    }}
 );
db.articles.aggregate( [
                        { $match : { score : { $gt : 70, $lte : 90 } } },
                        { $group: { _id: null, count: { $sum: 1 } } }
                       ] );
```
### MongoDB 复制（副本集）
### MongoDB 分片
### MongoDB 备份(mongodump)与恢复(mongorestore)
### MongoDB 监控

### 导入数据到集合
* 在命令行中执行mongoimport命令将上面下载的数据文件中的数据导入到test数据库的imp集合中。如果此集合已经存在，下面的操作会先删除。
```bash
mongoimport --db test --collection imp --drop --file /home/Larry/下载/dataset.json  --username test --password 123456
```
## 其他
### 数据操作
  * 聚合
  ```
  let contractAggs = await Contract.aggregate([
    { $match: conditionContract },
    { $project: { yearMonth: { $substr: [dateTQ, 0, -1] }, branchOne: 1, branchTwo: 1, branch: 1, agentCode: 1, agentTelephone: 1, agentName: 1, commissionPrem: 1, totalModalPrem: 1 } },
    { $group: { _id: '$agentCode', yearMonth: { $first: '$yearMonth' }, branchOne: { $first: '$branchOne' }, branchTwo: { $first: '$branchTwo' }, branchCode: { $first: '$branch' }, agentCode: { $first: '$agentCode' }, contractMobile: { $first: '$agentTelephone' }, agentName: { $first: '$agentName' }, fyc: { $sum: '$commissionPrem' }, totalPremium: { $sum: '$totalModalPrem' } } }
  ])
  ```
  * 去重筛选
  ```
  db.getCollection('basic_law').aggregate([
    { $match: { yearMonth:/2018/, branchCode: { $in: ['SLBX130401','SLBX010101'] } } },
    { $project: { branchCode:1,yearMonth:1 } },
    { $group: { _id: { branchCode: '$branchCode', yearMonth: '$yearMonth' }, branchCode: { $first: '$branchCode' }, yearMonth: { $first: '$yearMonth' } }}
  ])
  ```