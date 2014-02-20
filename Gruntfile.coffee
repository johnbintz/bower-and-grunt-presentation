module.exports = (grunt) ->
  require('matchdep').filter('grunt-*').forEach(grunt.loadNpmTasks)
  path = require('path')

  grunt.initConfig {
    express:
      server:
        options:
          bases: path.resolve(__dirname)
    compass:
      dist:
        options:
          config: 'config/compass.rb'
    watch:
      compass:
        files: [ 'sass/*.scss' ]
        tasks: [ 'compass' ]
    concurrent:
      dist:
        tasks: [ 'watch:compass', 'server' ]
        options:
          logConcurrentOutput: true
  }

  grunt.registerTask 'server', [ 'express', 'express-keepalive' ]
  grunt.registerTask 'default', 'concurrent:dist'
