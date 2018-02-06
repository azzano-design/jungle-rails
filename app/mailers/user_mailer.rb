class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation(order)
    @order = order
    @items = @order.line_items
    mail(to: @order.email, subject: 'OrderID #{@order.id}')
  end
end