class UserMailer < ApplicationMailer

	def contact_form(email, name, message)
		@message = message
			mail(:from => email,
				:to => "james@jameslipe.com",
				:subject => "A new message from #{name}")
	end

  def welcome(user)
    @appname = "James Bike Store App"
    mail ( :to => user.email,
      :subject => "Welcome to #{@appname}!")
  end
end
