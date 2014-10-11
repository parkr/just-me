# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

submitFormOnCommandEnter = (id) ->
  document.getElementById(id).addEventListener 'keydown', (e) ->
  	if e.keyCode == 13 and e.metaKey
  		@form.submit()

document.onreadystatechange = ->
  if @readyState is 'complete'
    submitFormOnCommandEnter('post_body')
