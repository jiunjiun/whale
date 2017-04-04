# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  handleImage = (e) ->
    resource = e.target.id.split('_')[-1..]
    reader = new FileReader
    reader.onload = (event) ->
      $("#sharks .#{resource} img").attr 'src', event.target.result
      return
    reader.readAsDataURL(e.target.files[0])

  imageLoader = $('#sharks .hide input[type=file]')
  imageLoader.bind('change', handleImage) if (imageLoader)


  $('#sharks .upload img').click ->
    resource = $(this).data('id')
    $("#sharks input[type=file]#shark_#{resource}").trigger('click');
