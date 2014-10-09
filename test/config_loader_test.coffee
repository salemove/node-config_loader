sinon = require 'sinon'
ConfigLoader = require '../lib/config_loader'

describe 'ConfigLoader', ->

  before ->
    @configFilePath = './test/fixtures/simple.yml'
    @environment = 'production'

  it 'loads config with correct environment', ->
    config = ConfigLoader.loadFor @environment, @configFilePath
    config.should.containEql({redis: { host: 'yawsah' }})
