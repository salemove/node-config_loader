sinon = require 'sinon'
ConfigLoader = require '../lib/config_loader'

describe 'ConfigLoader', ->
  configFilePath = './test/fixtures/simple.yml'

  it 'loads config with correct environment', ->
    configuration = ConfigLoader.loadFor 'production', configFilePath
    configuration.should.containEql({redis: { host: 'yawsah' }})
