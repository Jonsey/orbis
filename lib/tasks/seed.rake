namespace :naimad do

  desc "create admin accounts"
  task :create_admins => :environment do
    usr1 = User.find_or_create_by_email \
    :firstname => 'Damian',
    :lastname => 'Jones',
    :email => 'damianajones@yahoo.co.uk',
    :password => 'orgone642',
    :password_confirmation => 'orgone642'

    Lockdown::System.make_user_administrator(usr1)

    usr2 = User.find_or_create_by_email \
    :firstname => 'Finn',
    :lastname => 'Beales',
    :email => 'finn@surestate.net',
    :password => 'matrix',
    :password_confirmation => 'matrix'

    Lockdown::System.make_user_administrator(usr2)
  end

end
