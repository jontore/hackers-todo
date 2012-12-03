var fs = require('fs')
  , express = require('express')
  , http = require('http');

var app = express();
app.use(express.bodyParser());

var server = http.createServer(app);
server.listen(1234);

var tasks = [{desc: 'FOoo'}]

app.get('/', function (req, res) {
  res.sendfile(__dirname + '/index.html');
});

app.get('/api', function (req, res) {
  res.send(tasks);
});

app.post('/api', function (req, res) {
  var task = req.body;
  tasks.push(task);
  res.send(task);
});

app.get('*', function (req, res) {
  var path = __dirname + req.params[0];
  res.sendfile(path);
});