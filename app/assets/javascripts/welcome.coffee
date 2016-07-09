# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

check_create_form = ->
  username = document.getElementById("create_username").value
  password = document.getElementById("create_password").value
  cpassword = document.getElementById("create_confirm_password").value
  error = document.getElementById("create_error")

  if !username || !password || !cpassword
    error.innerHTML = "Error: All fields are required!"
    return false
  else if password != cpassword
    error.innerHTML = "Error: Password fields don't match!"
    return false
  else
    return true

check_login_form = ->
  username = document.getElementById("login_username").value
  password = document.getElementById("login_password").value
  error = document.getElementById("login_error")

  if !username || !password
    error.innerHTML = "Error: All fields are required!"
    return false
  else
    return true

window.check_create_form = check_create_form
window.check_login_form = check_login_form
