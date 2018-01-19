class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(email, order)
    @order = order
    @line_items = LineItem.joins(:product).where("order_id = #{@order.id}")
    # @url = 'http://localhost:3000/orders/:id'
    mail(to: email, subject: "Order ##{order.id} confirmed")
  end
end
