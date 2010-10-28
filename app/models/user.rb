class User < ActiveRecord::Base
  has_and_belongs_to_many :user_groups

  attr_accessible :email, :password, :password_confirmation

  acts_as_authentic do |c|
    c.login_field = 'email'
  end

  def activate!
    self.active = true
    save
  end

  def default_vacancies_list
    'awaiting_approval'
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notification.deliver_password_reset_instructions(self)
  end
  
  def deliver_activation_instructions!
    reset_perishable_token!
    Notification.deliver_activation_instructions(self)
  end

  def to_s
    "#{firstname} #{lastname}".camelize
  end

end


