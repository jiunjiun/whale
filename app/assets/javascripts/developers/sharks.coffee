# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  handleSharkImage = (e) ->
    resource = e.target.id.split('_')[-1..]
    reader = new FileReader
    reader.onload = (event) ->
      $("#sharks .#{resource} img").attr 'src', event.target.result
      return
    reader.readAsDataURL(e.target.files[0])

  imageLoader = $('#sharks .hide input[type=file]')
  imageLoader.bind('change', handleSharkImage) if (imageLoader)


  $('#sharks .upload img').click ->
    resource = $(this).data('id')
    $("#sharks input[type=file]#shark_#{resource}").trigger('click');

  if $('#sharks #dropzone_photo').length
    dropzone_photo = new Dropzone '#sharks #dropzone_photo',
      paramName: "shark_photo[image]",
      parallelUploads: 2
      maxFilesize: 5
      dictDefaultMessage: '點擊此處以上傳照片(或直接將照片拉到此處)<br><div style="margin:30px"><i class="fa fa-cloud-upload fa-3x"></i></div>'
      dictRemoveFile: '移除檔案'
      dictCancelUpload: '取消上傳'
      dictInvalidFileType: '檔案格式錯誤，請上傳圖片'
      init: (e) ->
        thisDropzone = @
        shark_id = $('#sharks').data('id')
        $.getJSON "/sharks/#{shark_id}/photos.json", (phots) ->
          $.each phots, (key, value) ->
            mockFile = { id: value.id, name: value.name, size: value.size, position: value.position }
            thisDropzone.options.addedfile.call(thisDropzone, mockFile)
            thisDropzone.options.thumbnail.call(thisDropzone, mockFile, value.url)
            thisDropzone.files.push(mockFile)
            $(thisDropzone.files[thisDropzone.files.length-1].previewElement).attr('data-id', value.id)

      success: (file, response) ->
        if response.status == 'success'
          file.id = response.photo.id
          file.position = response.position

      removedfile: (file) ->
        shark_id = $('#sharks').data('id')
        photo_id = file.id

        $.ajax
          type: 'DELETE',
          url: "/sharks/#{shark_id}/photos/#{photo_id}",
          dataType: 'json'

        _ref = undefined
        if (_ref = file.previewElement) != null then _ref.parentNode.removeChild(file.previewElement) else undefined

    el = document.getElementById('dropzone_photo')
    sortable = Sortable.create el,
      animation: 200
      onUpdate: (evt) ->
        shark_id = $('#sharks').data('id')
        shark_photo = {}

        $('#sharks #dropzone_photo .dz-preview').each (k, v) ->
          id = $(this).data('id')
          shark_photo[id] = {position: k+1}

        $.ajax
          type: 'PUT',
          url: "/sharks/#{shark_id}/photos"
          data: {shark_photo: shark_photo}
          dataType: 'json'
