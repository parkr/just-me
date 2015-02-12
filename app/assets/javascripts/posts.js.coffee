# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

shift = 0

submitFormOnCommandEnter = (id) ->
  document.getElementById(id).addEventListener 'keydown', (e) ->
  	if e.keyCode == 13 and e.metaKey
  		@form.submit()

encrypt = (content) ->
  caesarShift(content, shift)

decrypt = (content) ->
  caesarShift(content, (26 - shift) % 26)

encryptNode = (node) ->
  node.textContent = encrypt(node.textContent.trim())

decryptNode = (node) ->
  node.textContent = decrypt(node.textContent.trim())

addEncryptListener = (node) ->
  node.addEventListener 'click', (e) ->
    encryptNode(node)
    elClone = node.cloneNode(true)
    node.parentNode.replaceChild(elClone, node)
    addDecryptListener(elClone)

addDecryptListener = (node) ->
  node.addEventListener 'click', (e) ->
    decryptNode(node)
    elClone = node.cloneNode(true)
    node.parentNode.replaceChild(elClone, node)
    addEncryptListener(elClone)

encryptMessages = (className) ->
  shift = Math.floor(Math.random() * 26)
  for node in document.getElementsByClassName(className)
    encryptNode(node)
    addDecryptListener(node)

document.onreadystatechange = ->
  if @readyState is 'complete'
    submitFormOnCommandEnter('post_body')
    encryptMessages('post-body')
