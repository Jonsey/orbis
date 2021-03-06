class Notification < ActionMailer::Base

  def contact(params, email_subject = nil)
    subject case email_subject
            when "consultation"
              "Free consultation request"
            else
              "Web site enquiry"
            end

    recipients ["nkp@orbis-resourcing.com", "bpm@orbis-resourcing.com"]
    bcc "damianajones@yahoo.co.uk"
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

  def new_vacancy(vacancy)
    subject "Vacancy submission"

    recipients  configatron.new_vacancy_email
    bcc ["nkp@orbis-resourcing.com"]
    from        configatron.admin_email
    sent_on     Time.now.utc
    body        :vacancy => vacancy
  end

  def approved_vacancy(vacancy)
    subject "Your vacancy has been approved"

    recipients  vacancy.client.email
    from        vacancy.staff.email
    sent_on     Time.now.utc
    body        :vacancy => vacancy
  end

  def candidate_welcome(candidate)
    subject      "Welcome to Orbis Resourcing"
    recipients   candidate.email
    bcc ["nkp@orbis-resourcing.com", "noreply@orbis-resourcing.com"]
    from         configatron.admin_email
    sent_on      Time.now.utc
    body         :candidate => candidate
  end

  def client_welcome(client)
    subject      "Welcome to Orbis Resourcing"
    recipients   client.email
    bcc ["nkp@orbis-resourcing.com", "noreply@orbis-resourcing.com"]
    from         configatron.admin_email
    sent_on      Time.now.utc
    body         :client => client
  end

  def staff_welcome(staff)
    subject      "Welcome to Orbis Resourcing"
    recipients   staff.email
    from         configatron.admin_email
    sent_on      Time.now.utc
    body         :staff => staff
  end

  def activation_instructions(user)
    subject       "Orbis Resourcing - Activation Instructions"
    from          configatron.admin_email # Removed name/brackets around 'from' to resolve "555 5.5.2 Syntax error." as of Rails 2.3.3
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_url(user.perishable_token)
  end

end
