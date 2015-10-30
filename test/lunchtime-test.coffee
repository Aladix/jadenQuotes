chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'The hubot-jaden script', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
    require('../src/jaden')(@robot)

  describe 'should register a respond listener for', ->

    it 'jaden me', ->
      expect(@robot.respond).to.have.been.calledWith(/jaden me/i)

    it 'jaden latest', ->
      expect(@robot.respond).to.have.been.caleldWith(/jaden latest/i)
