class TvshowMailer < ApplicationMailer
	def send_email(email)
	  	@tvshows = Tvshow.where(favourite: true)
	  	mail(to: email, subject: "Favourite TV Show")
	  end
end 