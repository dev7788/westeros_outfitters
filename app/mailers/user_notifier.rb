class UserNotifier < ActionMailer::Base
  default from: "do-not-reply@westerosoutfitters.herokuapp.com"

  def send_signup_email(user)
    @user = user
    @url  = "http://westerosoutfitters.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to Westeros Outfitters!")
  end
end
