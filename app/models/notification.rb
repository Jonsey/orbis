class Notification < ActionMailer::Base

  def contact(params, email_subject = nil)
    subject = case email_subject
              when "consultation"
                "Free consultation request"
              else
                "Web site enquiry"
              end

    recipients "damianajones@yahoo.co.uk"
    from params[:email]
    sent_on Time.now.utc
    body :message => params
  end

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          configatron.admin_email
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

  def new_vacancy(params)

  end


end
