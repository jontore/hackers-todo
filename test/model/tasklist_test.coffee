define [
  'cs!src/models/tasklist'
], (Tasklist) ->

  buster.testCase 'tasklist'
    'setUp': ->
      @tasklist = new Tasklist

    'tearDown': ->
      @xhr?.restore()

    'uses correct URL to fetch data': (done) ->
      @xhr = sinon.useFakeXMLHttpRequest()

      @xhr.onCreate = (xhr) ->
        _.defer ->
          assert.equals xhr.url, '/api'
          done()

      @tasklist.fetch()