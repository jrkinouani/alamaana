class Charge < ActiveRecord::Base
	validates :email, :presence => true
	validates :first_name, :presence => true
	 validates :last_name, :presence => true
	 validates :price, :presence => true

	 def next_step
  		self.current_step = steps[steps.index(current_step)+1]
	end
end
