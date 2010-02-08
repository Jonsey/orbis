class Notification < ActionMailer::Base

  def contact(params)
    subject "Web enquiry"
    recipients "damianajones@yahoo.co.uk"
    from params[:email]
    sent_on Time.now.utc
    body :message => params
  end

end
