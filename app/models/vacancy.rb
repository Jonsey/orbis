class Vacancy < ActiveRecord::Base
  include AASM

  validates_presence_of \
  :title,
  :role,
  :salary,
  :location,
  :duration,
  :key_skills,
  :role_description

  aasm_column :status
  aasm_initial_state :draft

  aasm_state :draft
  aasm_state :awaiting_approval
  aasm_state :live
  aasm_state :archived

  aasm_event :submit_for_approval do
    transitions :to => :awaiting_approval, :from => :draft
  end

  aasm_event :approve do
    transitions :to => :live, :from => :awaiting_approval
  end

  aasm_event :archive do
    transitions :to => :archived, :from => :live
  end

  def self.find_by_owner_and_status(client_id, status)
    belonging_to(client_id).with_status(status)
  end

  def editor_ids
    ug = UserGroup.find_by_name(:administrators)
    ug.user_ids |= [self.client_id]
  end

  private

  named_scope :belonging_to, lambda { |owner_id|
    { :conditions => { :client_id => owner_id } }
  }
  named_scope :with_status, lambda { |state|
    { :conditions => { :status => state } }
  }

end
