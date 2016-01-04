sinon = require 'sinon'
ConfigLoader = require '../lib/config_loader'

describe 'ConfigLoader', ->
  configFilePath = './test/fixtures/simple.yml'

  it 'loads config with correct environment', ->
    configuration = ConfigLoader.loadFor 'production', configFilePath
    configuration.should.containEql({redis: { host: 'yawsah' }})

  it 'loads multiline strings', ->
    configuration = ConfigLoader.loadFor 'production', configFilePath
    configuration.should.containEql(multiline: "one:two")

  context 'with environment variables declared', ->
    before ->
      process.env.foo = 'foo-val'

    loadConf = ->
      ConfigLoader.loadFor 'flexible', configFilePath

    it 'exposes undefined environment value as null', ->
      loadConf().should.containEql(undefined_val: null)

    it 'exposes defined environment variables', ->
      loadConf().should.containEql(foo: 'foo-val')
