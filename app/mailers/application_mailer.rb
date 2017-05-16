class ApplicationMailer < ActionMailer::Base
  default from: 'welcome_to_the@jungle.com'
  layout 'mailer'
end

class UserMailer < ApplicationMailer

  def order_confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: "Order Confirmation - Order-id:#{@order.id}")
  end

end