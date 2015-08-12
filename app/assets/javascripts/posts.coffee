# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  new PostCropper()
  
class PostCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 480, 480]
      minSize: [480, 480]
      maxSize: [480, 480]
      onSelect: @update
      onChange: @update
      
      
  update: (coords) =>
    $('#post_crop_x').val(coords.x)
    $('#post_crop_y').val(coords.y)
    $('#post_crop_w').val(coords.w)
    $('#post_crop_h').val(coords.h)