require 'coffee-script'
express = require 'express'
http = require 'http'
path = require 'path'
app = express();

app.configure ->
  app.set('port', process.env.PORT || 3000)
  app.set('views', path.join(__dirname, '../views'))
  app.use(express.favicon())
  app.use(express.logger('dev'))
  app.use(express.bodyParser())
  app.use(express.methodOverride())
  app.use(app.router)
  app.use(express.static(path.join(__dirname, '../../app')))

app.configure 'development', ->
  app.use(express.errorHandler())

app.get '/', (req, res) ->
  res.redirect '/index.html'
  #res.send "It's alive!"

http.createServer(app).listen app.get('port'), ->
  console.log "Server is alive and listening on port #{app.get('port')}."
  console.log "__dirname is currently set to #{__dirname}"
