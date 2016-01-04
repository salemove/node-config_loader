var YAML = require('yamljs'),
    EJS  = require('ejs'),
    fs   = require('fs'),
    CONFIGURATION_FILE_PATH = './config/application.yml';

var readFor = function(arg) {
  var environment    = arg.environment,
      configurations = arg.configurations;

  if (configurations[environment] != null)
    return configurations[environment];
  else
    throw 'Could not find configuration for ' + environment + ' environment';
};

var loadFor = function(environment, configFilePath) {
  if (configFilePath == null)
    configFilePath = CONFIGURATION_FILE_PATH;

  var content = fs.readFileSync(configFilePath, 'ascii');
  var configurations = YAML.parse(EJS.render(content));

  return readFor({
    environment: environment,
    configurations: configurations
  });
};

module.exports = {
  loadFor: loadFor
};
