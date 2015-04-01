gulp        = require 'gulp'
coffee      = require 'gulp-coffee'

gulp.task 'default', ['coffee']

gulp.task 'coffee', ->
  gulp.src './app/coffee/*.coffee'
  .pipe coffee({bare: true})
  .pipe gulp.dest('./app/js/')

watcher = gulp.watch './app/coffee/*.coffee', ['coffee']

watcher.on 'change', (event) ->
  console.log 'File ' + event.path + ' ' + event.type + ', compiling...'