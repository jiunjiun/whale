# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  handleUserAvatar = (e) ->
    resource = e.target.id.split('_')[-1..]
    reader = new FileReader
    reader.onload = (event) ->
      $("#users .#{resource} img").attr 'src', event.target.result
      return
    reader.readAsDataURL(e.target.files[0])

  imageLoader = $('#users .hide input[type=file]')
  imageLoader.bind('change', handleUserAvatar) if (imageLoader)


  $('#users .upload img').click ->
    $("#users input[type=file]").trigger('click');
