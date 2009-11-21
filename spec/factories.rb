Factory.define :user_group do |cd|
  cd.name 'Client'
end

Factory.define :user do |c|
  c.login 'user.jones'
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "User"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.email {|a| "#{a.firstname}.#{a.lastname}@example.com".downcase }
end

Factory.define :client, :class => Client do |c|
  c.login 'client.jones'
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "Client"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.email {|a| "#{a.firstname}.#{a.lastname}@example.com".downcase }
  c.company_name 'Space tech'
end

Factory.define :candidate, :class => Candidate do |c|
  c.login 'candidate.jones'
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "Candidate"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.email {|a| "#{a.firstname}.#{a.lastname}@example.com".downcase }
end

Factory.define :vacancy do |v|
  v.title 'Senior Ruby developer in space'
  v.role 'Senior Ruby developer'
  v.salary '50000'
  v.location 'Space'
  v.duration '6 Months'
  v.key_skills 'Lorem ipsum dolor sit amet.'
  v.role_description 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  v.client_id Factory.build(:client)
  v.status 'draft'
end



