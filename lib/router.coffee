Router.configure 
  layoutTemplate: "layout"
  loadingTemplate: 'loading'
  waitOn: ->
    return Meteor.subscribe 'posts'
  
Router.map ->
  @route "postsList",
    path: "/"
  
  @route 'postPage',
    path: '/posts/:_id'
    data: ->
      return Posts.findOne @params._id
      
  @route 'postEdit',
    path: '/posts/:_id/edit'
    data: ->
      return Posts.findOne @params._id
      
  @route 'postSubmit',
    path: '/submit'

  return

requireLogin = (pause) ->
  if !Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render 'accessDenied'
      
    pause()
    
Router.onBeforeAction 'loading'
Router.onBeforeAction requireLogin, {only: 'postSubmit'}