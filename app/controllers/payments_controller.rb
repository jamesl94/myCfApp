class PaymentsController < ApplicationController

  def create
    #Get product
    @product = Product.find(params[:product_id])
    if user_signed_in?
      #Get user
      @user = current_user
    else
      redirect_to "/devise/registrations/new"
    end

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
      if charge.paid
        Order.create(user_id: @user.id, product_id: @product.id, total: @product.price)
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error with your payment: #{err[:body]}"
    end
  end
end
