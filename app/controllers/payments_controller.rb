class PaymentsController < ApplicationController

  def create
    #Get product
    @product = Product.find(params[:product_id])
    #Get user
    @user = current_user

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    #Get email
    email = params[:stripeEmail]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100).to_s.to_i, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => @product.name
      )
      PaymentMailer.payment(email, @product).deliver_now
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
end
