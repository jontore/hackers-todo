define ['rivets'], (rivets) ->

  rivets.configure
    adapter:
      subscribe: (obj, keypath, callback) ->
        callback.wrapped = (m, v) -> callback(v)
        obj.on 'change:' + keypath, callback.wrapped if obj.on

      unsubscribe: (obj, keypath, callback) ->
        obj.off 'change:' + keypath, callback.wrapped if obj.off

      read: (obj, keypath) ->
        if obj.get then obj.get keypath else obj[keypath]

      publish: (obj, key, value) ->
        o = {}
        o[key] = value
        obj.set o
        obj.trigger "change:#{key}", obj, value

  rivets