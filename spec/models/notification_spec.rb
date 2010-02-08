require 'spec_helper'

describe Notification do
  # Send the email, then test that it got queued
  params = {
    "company_name"=>"Comapny",
    "enquiry"=>"This is the test email.",
    "lastname"=>"Jones",
    "firstname"=>"DAmian",
    "telephone"=>"07010 717232",
    "email"=>"damianajones@yahoo.co.uk"}

  email = Notification.deliver_contact(params)
  email.message.should eql(params[:enquiry])
end
