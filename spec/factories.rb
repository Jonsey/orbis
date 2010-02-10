Factory.define :user_group do |cd|
  cd.name 'Client'
end

Factory.define :user do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "User"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.email {|a| "#{a.firstname}.#{a.lastname}@example.com".downcase }
end

Factory.define :staff do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "User"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.email {|a| "#{a.firstname}.#{a.lastname}@example.com".downcase }
end

Factory.define :client, :class => Client do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "Client"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.email {|a| "#{a.firstname}.#{a.lastname}@example.com".downcase }
  c.company_name 'Space tech'
end

Factory.define :candidate, :class => Candidate do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "Candidate"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.email {|a| "#{a.firstname}.#{a.lastname}@example.com".downcase }
end

Factory.define :category, :class => Category do |c|
  c.parent_id nil
  c.name "Technology"
end


Factory.define :vacancy, :class => Vacancy, :default_strategy => :create do |v|
  v.role 'Senior Ruby developer'
  v.category_id Factory.build(:category)
  v.salary '50000'
  v.location 'Space'
  v.role_description 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  v.client_id Factory.build(:client)
  v.status 'draft'
end



