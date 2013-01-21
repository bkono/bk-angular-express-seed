{exec} = require 'child_process'
path = require 'path'

task 'build:server', 'Build project from server/src/*.coffee to dist/*.js', ->
  exec 'coffee --compile --output server/dist/ server/src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
    console.log 'Build task complete.'

task 'watch:server', 'Watch and build project from server/src/*.coffee to server/dist/*.js', ->
  console.log 'Now watching...'
  exec 'coffee -w --compile --output server/dist/ server/src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
    console.log '.. done watching.'

task 'test:run:server', 'Run server only mocha tests', ->
  console.log 'Running server only mocha tests...'
  exec "mocha", ["--colors", "#{path.join(__dirname, 'test/server/**/*.coffee')}"], (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
    console.log '... done running.'
