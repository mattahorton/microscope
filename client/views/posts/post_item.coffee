Template.postItem.helpers 
  ownPost: ->
    return @userId == Meteor.userId()
  domain: ->
    a = document.createElement("a")
    a.href = @url
    if a.hostname isnt "localhost"
      return a.hostname
    return @url