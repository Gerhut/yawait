yawait = require '../lib/yawait'

describe 'yawait', ->
  it 'should receive the result which the promise yielded is resolved', (done) ->
    yawait ->
      (yield Promise.resolve 'value').should.exactly 'value'
      done()
    return

  it 'should throw the reason when the promise yielded is rejected', (done) ->
    yawait ->
      try
        yield Promise.reject Error 'reason'
        done Error 'Unreachable code.'
      catch e
        e.should.have.property 'message', 'reason'
        done()
    return

  it 'should return the promise returned in generator', ->
    Promise.all [
      (yawait ->
        yield null
        Promise.resolve 'value')
      .should.finally.exactly 'value'
      (yawait ->
        yield null
        Promise.reject Error 'reason')
      .should.rejectedWith 'reason'
    ]

  it 'should deal with normal function instead of generator', ->
    Promise.all [
      (yawait -> Promise.resolve 'value').should.finally.exactly 'value'
      (yawait -> Promise.reject Error 'reason').should.rejectedWith 'reason'
    ]
    