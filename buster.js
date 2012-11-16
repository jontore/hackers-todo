var config = module.exports;

config["browser test"] = {
  autoRun: false,
  environment: "browser",
  rootPath: "./",
  libs: [
    'lib/require.js',
    'src/config/requirejs-config.js'
  ],
  resources: [
    'lib/*.js',
    'src/**/*.coffee',
    'src/**/*.html',
  ],
  tests: [
    'test/**/*.coffee'
  ],
  extensions: [
    require("buster-amd"),
    require("buster-coffee")
  ],
  'buster-amd': {
    // Load tests written in CoffeeScript as AMD modules
    pathMapper: function (path) {
      return "cs!" + path.replace(/^\//, "").replace(/\.coffee$/, "");
    }
  }
};
