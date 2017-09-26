class UserMailer < ApplicationMailer
<<<<<<< HEAD
	default from: "james@jameslipe.com"

	def contact_form(email, name, message)
		@message = message
			mail(:from => email,
				:to => "james@jameslipe.com",
				:subject => "A new message from #{name}")
	end
=======

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
				:to => "james@jameslipe.com",
				:subject => "A new message from #{name}")
	end

  def welcome(user)
    @appname = "James Bike Store App"
    mail( :to => user.email,
      :subject => "Welcome to #{@appname}!")
  end
>>>>>>> b0565d5380cd6b33d195753fe678771aaddc6dec
end
