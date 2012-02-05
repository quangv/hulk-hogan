# Purpose

Connect [Hogan.js]() with [Express](), with support for Partials.

```
Hi {{name}}

{{> salute}}
```

# Usage

_views/index.hulk_

```mustache
Hello {{what}}!
```

__CoffeScript__

_app.coffee_

```coffee
  express = require 'express'
  hulk = require 'hulk-hogan'

  app = express.createServer()

  app.set 'views', __dirname+'/views'  # Directory of your views
  app.set 'view options', layout:false
  app.set 'view engine', 'hulk'  # use the .hulk file extensions for your views
  app.register '.hulk', hulk  # register to render .hulk with Hulk-Hogan

  app.get '/', (req,res)->
    res.render 'index', {what:'World'}

  app.listen 3000
```

`coffee app.coffee` _http://localhost:3000_ would produce: 

> Hello World!

__JavaScript__

_app.js_

```javascript
 var app, express, hulk;

 express = require('express');
 hulk = require('hulk-hogan');

 app = express.createServer();

 app.set('views', __dirname + '/views');
 app.set('view options', {layout: false});
 app.set('view engine', 'hulk');
 app.register('.hulk', hulk);

 app.get('/', function(req, res) {
   res.render('index', {
     what: 'World'
   });
 });

 app.listen(3000); 
  
```


`node app.js` _http://localhost:3000_ would produce:

> Hello World!

# Others

Hulk-Hogan inspired by [HBS](https://github.com/donpark/hbs)

should checkout [express-hogan.js](https://github.com/Dundee/express-hogan.js)

and [Micah Smith's hogan-express.js blog post](http://allampersandall.blogspot.com/2011/12/hoganjs-expressjs-nodejs.html) for reference.

---

*Special Thanks* to the [Hogan.js](https://github.com/twitter/hogan.js) Twitter Team, as well as Hulk-Hogan's grand-dad, (or is it more like Great Uncle?) [Mustache](http://mustache.github.com/) 
