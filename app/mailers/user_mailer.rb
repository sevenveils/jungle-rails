class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order)
    @order = order
    subject = %(Order #{@order.id})
    mail(to: @order.email, subject: subject)
  end

end
