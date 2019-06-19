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
## 函数声明&函数表达式
  ```js
  // a.js
  function foo () {} // 函数声明
  ```
  ```js
  // b.js
  (function foo () {})() // 函数表达式
  (function bar (){}) // 函数表达式
  (function (){})() // 函数表达式
  (function () {}()) // 函数表达式 (立即执行函数表达式的一种写法)
  setTimeout(function () {}, 1000) // 函数表达式
  var fn = function foo () {} // 函数表达式
  ```
  * 区分函数声明与函数表达式的方法是看 function 关键字是在声明中出现的位置，如果 function 是声明中的第一个词，则是函数声明，否则是函数表达式。
  * 函数声明和函数表达式一个重要的区别是函数名绑定在何处，上面例子中 a.js 是绑定在全局作用域中，b.js 是绑定在函数表达式自身的函数中，例如 b.js 中 (function foo () {...})() foo 只能在 ... 的中可以访问，其他地方不能访问。
  * 函数表达式可以是匿名的，函数声明是必须要有名称的