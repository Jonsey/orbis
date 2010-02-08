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


end
