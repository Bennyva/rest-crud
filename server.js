var express = require("express");
var mysql   = require("mysql");
var bodyParser  = require("body-parser");
/*var formidable = require("formidable");*/
var md5 = require('MD5');

var routes = require('./routes');
var http = require('http');
var path = require('path');

//load questions routes
var questions = require('./routes/questions');


var rest = require("./REST.js");
var app  = express();

app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'rest-crud')));


function REST(){
    var self = this;
    self.connectMysql();
};

REST.prototype.connectMysql = function() {
    var self = this;
    var pool      =    mysql.createPool({
        connectionLimit : 100,
        host     : 'localhost',
        user     : 'root',
        password : 'password',
        database : 'paramedic_application_db',
        debug    :  false
    });
    pool.getConnection(function(err,connection){
        if(err) {
          self.stop(err);
        } else {
          self.configureExpress(connection);
          console.log("Database connected...")
        }
    });
}

REST.prototype.configureExpress = function(connection) {
      var self = this;
      app.use(bodyParser.urlencoded({ extended: true }));
      app.use(bodyParser.json());
      var router = express.Router();
      app.use('/api', router);
      var rest_router = new rest(router,connection,md5);
      self.startServer();
}

REST.prototype.startServer = function() {
      http.createServer(app).listen(app.get('port'), function(){
          console.log("All right ! I am alive at Port " + app.get('port'));
      });
}

REST.prototype.stop = function(err) {
    console.log("ISSUE WITH MYSQL n" + err);
    process.exit(1);
}

new REST();



  app.get('/', function (req, res) {
     res.sendfile("login.html" );
  });

  app.get('/newQuestion', function (req, res) {
     res.sendfile("loginSent.html" );
  });



/*
//API Router
var router = express.Router();
var index = require('./routes/index').router;
app.use('/',index);
//start Server
var server = app.listen(3000,function(){
 
   console.log("Listening to port %s",server.address().port);
});
*/