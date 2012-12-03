{exec} = require 'child_process'

task 'lint', 'run coffeelint', ->
  p = exec 'coffeelint src/**/*.coffee', (error, stdout, stderr) ->
    for arg in arguments
      console.log arg if arg