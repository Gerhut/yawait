module.exports = (genFunc) ->
  new Promise (resolve, reject) ->
    genObj = genFunc()

    next = (obj) ->
      if obj.done
        Promise.resolve(obj.value).then resolve, reject
      else
        Promise.resolve(obj.value).then(
          (value) -> next genObj.next value 
          (reason) -> next genObj.throw reason
        )

    if genObj.next?
      next genObj.next()
    else
      resolve genObj