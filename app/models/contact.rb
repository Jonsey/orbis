class Contact < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :company_name, :telephone, :enquiry, :spam_answer, :cv_attributes
end
