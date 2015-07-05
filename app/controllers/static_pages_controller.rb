class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def mentions
  	
  end
  def charges
    Stripe.api_key = "sk_test_OYnaaxeKJWTkcVODcqUWMfLr"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    @charge = Charge.new(charges_params)
    #@charge.save 

  	begin
	  charge = Stripe::Charge.create(

	    :amount => @charge.price.to_i*100,
	    :currency => "eur",
	    :source => token,
	    :description => "Example charge"
	  )
	 
	  #redirect_to root_path

	rescue Exception => e
     flash[:notice] = e.message
	  # The card has been declined
	end
  end

  def paiement
  	@charge = Charge.new

  end
  def charges_params
    params.require(:charge).permit(:email, :first_name, :last_name, :price)
  end
end
