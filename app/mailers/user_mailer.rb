class UserMailer < ApplicationMailer

  default from: 'welcome_to_the@jungle.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Order Confirmed')
  end

end