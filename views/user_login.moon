
class UserLogin extends require "widgets.base"
  content: =>
    h2 "Login"
    @render_errors!

    form action: @url_for"user_login", method: "POST", class: "form", ->
      div class: "row", ->
        label for: "username_field", "Username or email"
        input type: "text", name: "username", id: "username_field", autofocus: "autofocus"

      div class: "row", ->
        label for: "password_field", "Password"
        input type: "password", name: "password", id: "password_field"

      div class: "button_row", ->
        input type: "submit"
        raw " &middot; "
        a href: @url_for"user_forgot_password", "Forgot Password"

