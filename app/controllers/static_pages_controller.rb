class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def mentions
  	
  end
  def charges

    @charge = Charge.new(charges_params)
  	begin
	  charge = Stripe::Charge.create(
	    :amount => 1000, # amount in cents, again
	    :currency => "usd",
	    :source => token,
	    :description => "Example charge"
	  )
	 
	  redirect_to root_path

	rescue Exception => e

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
