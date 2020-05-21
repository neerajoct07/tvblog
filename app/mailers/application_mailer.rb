class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def send_email(email)
  	@tvshows = Tvshow.where(favourite: true)
  	mail(to: email, subject: "Favourite TV Show")
  end
end
