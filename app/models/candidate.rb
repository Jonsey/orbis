class Candidate < User
  validates_presence_of :firstname, :lastname, :telephone
end
