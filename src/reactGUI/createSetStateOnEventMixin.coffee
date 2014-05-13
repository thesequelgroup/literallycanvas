React = require './React-shim'

module.exports = createSetStateOnEventMixin = (eventName) ->
  componentDidMount: ->
    @subscriber = => @setState @getState()
    @props.lc.on eventName, @subscriber
  componentWillUnmount: ->
    @props.lc.removeEventListener(eventName, @subscriber)