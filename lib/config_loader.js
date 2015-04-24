var YAML = require('yamljs'),
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

  var configurations = YAML.load(configFilePath);

  return readFor({
    environment: environment,
    configurations: configurations
  });
};

module.exports = {
  loadFor: loadFor
};
