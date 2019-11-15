# 响应式导航栏
<!-- 响应式导航栏 -->
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
  <style>
  body {
    padding-top: 50px;
  }
  .mobile.only {
    display: none !important;
  }
  @media only screen and (max-width: 768px) {
    .computer.only {
      display: none !important;
    }
    .mobile.only {
      display: block !important;
    }
    .mobile.only .link.item {
      font-size: 1em !important;
    }
    .mobile.only .link.item:hover {
      background: rgba(255,255,255,.08) !important;
    }
  }
  </style>
</head>
<body>
  <div class="ui inverted top fixed large computer only menu">
    <div class="ui container">
      <div class="item">AAA</div>
      <div class="item">BBB</div>
      <div class="item">CCC</div>
    </div>
  </div>
  <div class="ui inverted fluid top fixed mobile only accordion vertical menu">
    <div class="item">
      <div class="title" style="clear: both;">
        &nbsp;<i class="content icon" style="float: right;"></i>
      </div>
      <div class="content">
        <div class="vertical menu">
          <div class="link item">AA</div>
          <div class="link item">BB</div>
          <div class="link item">CC</div>
          <div class="link item">DD</div>
        </div>
      </div>
    </div>
  </div>
  <div class="ui container">
    <div class="ui segment">
      <div class="ui fluid placeholder">
        <div class="ui fluid image header">
          <div class="line"></div>
          <div class="line"></div>
          <div class="full line"></div>
          <div class="line"></div>
          <div class="line"></div>
          <div class="line"></div>
          <div class="line"></div>
          <div class="line"></div>
          <div class="line"></div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
  <script>
  $(function() {
    $('.ui.dropdown').dropdown({
      clearable: true
    })
    $('.ui.checkbox').checkbox()
    $('.browse').popup({
      popup: '.ui.fluid.popup',
      on: 'click'
    })
    $('.ui.accordion').accordion({
      exclusive: false
    })
  })
  </script>
</body>
</html>
```
# 折叠式菜单
```html
<div class="ui accordion vertical menu">
    <div class="link item">还记得是谁地方</div>
    <div class="link item">
      <div class="title"><i class="dropdown icon"></i> AAA</div>
      <div class="content">
        <div class="link item">A1</div>
        <div class="link item">
          <div class="title"><i class="dropdown icon"></i> A2</div>
          <div class="content">
            <div class="link item">A21</div>
            <div class="link item">A22</div>
            <div class="link item">A23</div>
          </div>
        </div>
        <div class="link item">A3</div>
        <div class="link item">A4</div>
      </div>
    </div>
  </div>
  <div class="ui accordion vertical menu">
    <div class="item">还是打击开发商</div>
    <div class="item">
      <div class="title"><i class="dropdown icon"></i> AAA</div>
      <div class="content">
        <div class="menu">
          <div class="item">A1</div>
          <div class="item">A2</div>
          <div class="item">
            <div class="title"><i class="dropdown icon"></i> A2</div>
            <div class="content">
              <div class="menu">
                <div class="item">A21</div>
                <div class="item">A22</div>
                <div class="item">A23</div>
              </div>
            </div>
          </div>
          <div class="item">A4</div>
        </div>
      </div>
    </div>
    <div class="item">东方闪电</div>
  </div>
```
