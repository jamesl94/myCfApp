class PaymentMailer < ApplicationMailer
  def payment(email, product)
    @price = product.price
    @message = "Thanks for paying #{@price} for that bike!!"
    mail(:to => email,
      :message => @message)
  end
end
