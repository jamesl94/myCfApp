class UserMailer < ApplicationMailer
	default from: "james@jameslipe.com"

	def contact_form(email, name, message)
		@message = message
			mail(:from => email,
				:to => "james@jameslipe.com",
				:subject => "A new message from #{name}")
	end
end
