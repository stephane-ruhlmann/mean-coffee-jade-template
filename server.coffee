express         = require 'express'
bodyParser      = require 'body-parser'
methodOverride  = require 'method-override'
mongoose        = require 'mongoose'
_               = require 'underscore'
app             = express()

schemas = require './schemas.coffee'

######################
#     APP CONFIG
######################

app.use bodyParser.json()
app.use bodyParser.urlencoded {extended: true}
app.use methodOverride()
app.use express.static(__dirname + '/app')

app.set 'views', __dirname + '/app/views'
app.set 'view engine', 'jade'

app.use (req, res, next) ->
  # display only API request
  unless req.url.indexOf('/partials') > -1 or req.url.indexOf('/favicon') > -1 or req.url.indexOf('/lib') > -1
    console.log "%s REQUEST ON '%s'", req.method, req.url
  next()

app.use (err, req, res, next) ->
  console.log "MIDDLEWARE ERROR FROM #{req.method}:#{req.url}"
  console.log err
  res.send 'Error'


######################
#         DB
######################

mongoose.connect 'mongodb://localhost:27017/'
db = mongoose.connection

db.on 'error', ->
  console.log 'Connection to MongoDB : FAILED'

db.once 'open', ->
  console.log 'Connection to MongoDB : OK'

######################
#        API
######################

######################
#       ROUTES
######################

app.get '/', (req, res, next) ->
  res.render 'index.jade'

app.get '/partials/:name', (req, res, next) ->
  name = req.params.name
  res.render 'partials/' + name

######################
#    LAUNCH SERVER
######################

server = app.listen 9090, ->
  port = server.address().port
  console.log 'Server listening on port %s', port
