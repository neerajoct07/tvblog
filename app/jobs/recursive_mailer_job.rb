class RecursiveMailerJob
	def queue_name
		"recursive_mail_job"
	end
	def enqueue(job)
		job.save!
	end

	def max_attempts
		2
	end

	def preform
		Delayed::Job.enqueue(RecursiveMailerJob.new, run_at: 30.minutes.since)
		email_send
	end

	private

	def email_send
		users.each do |user|
			TvshowMailer.send_email(user.email) if user.email.present?
		end
	end

	def users
		@users = User.all
	end
end