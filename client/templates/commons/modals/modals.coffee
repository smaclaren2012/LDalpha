Template.MainModal.helpers

  "modalTemplate": () ->
    return Session.get('modalTemplate')

  "modalTitle": () ->
    return Session.get('modalTitle')

Template.Bookshelf.helpers
   'bookinfo': () ->
     return Bookshelf.find({})

Template.Bookshelf.events
    'click #delete-from-bookshelf': () ->
      title = $('#book-info').find('#title').text()
      LibraryBookshelf.deleteBookFromBookshelf(title)

Template.Register.events

    "click #close": () ->
      $('#register-modal').modal 'hide'

    "click #complete-register": () ->
      Patron.registerPatron()

Template.Account.events

  "click #change-username": () ->
    Account.changeUserInfo('username')

  "click #change-password": () ->
    Account.changeUserInfo('password')

  "click #delete-account": () ->
    user = Meteor.userId()
    Account.deleteAccount(user)


Template.Admin.events

    "click #log-in-as-admin": () ->
      Admin.logInAdmin()

Template.Help.events

  "click #send-help-request": () ->
    message = $('#help-request').val()
    Account.helpRequest(message)
    $('#help-request').val('')

Template.Users.helpers

  "users": () ->
    return Meteor.users.find({})

Template.Users.events

  "click #delete-user": (event) ->
    username = $('.user-content').find('#username').text()
    userid = Meteor.users.findOne({username:username})._id
    Account.deleteAccount(userid)
