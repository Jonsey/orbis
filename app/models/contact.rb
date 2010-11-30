class Contact < ActiveRecord::Base
  acts_as_textcaptcha({'api_key' => 'dqx847dqs48c4g4gok0ogo008i925x27'})
  attr_accessible :email, :firstname, :lastname, :company_name, :telephone, :enquiry, :spam_answer, :cv_attributes, :possible_answers
end