module.exports = function(grunt) {

  grunt.initConfig({
    coffeelint: {
      app: [
        'src/**/*.coffee'
      ]
    },
    coffeelintOptions: {
      "max_line_length": {
        "value": "125",
        "level": "error"
      }
    },
    shell: {
      test: {
          command: 'buster test',
          stderr: true,
          stdout: true
      }
    }
  });

  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-coffeelint');

  grunt.registerTask('default', [
    'coffeelint',
    'shell:test'
  ]);

};