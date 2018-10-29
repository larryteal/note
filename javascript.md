# JS
## 优雅的使用 js 嵌套对象
  * 使用 lodash
  ```js
  let obj = {
    a: {
      b: {
        c: 100
      }
    }
  }
  if(_.has(obj, 'a.b.c')){
    // 替代 if(obj.a && obj.a.b && obj.a.b.c)
  }
  if(_.get(obj, 'a.b.c') === 100){
    //
  }
  if(_.get(obj, 'a.bb.cc.dd') === 10){
    //
  }
  _.set(obj, 'a.bb.cc.dd.e', 1000)
  ```