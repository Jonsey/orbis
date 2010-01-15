Then /^I should see all the common user fields$/ do
  response.should have_tag("fieldset") do
    with_tag("label", :html => "Login")
    with_tag("label", :html => "Email")
    with_tag("label", :html => "First Name")
    with_tag("label", :html => "Surname")
    with_tag("label", :html => "Telephone")
    without_tag("label", :html => "Password")
    without_tag("label", :html => "Password Confirmation")
  end
end
