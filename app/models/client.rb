class Client < User
  validates_presence_of :firstname, :lastname, :telephone, :company_name
end
