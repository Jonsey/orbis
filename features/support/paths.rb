module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the registration page/
      signup_path
    when /the login page/
      login_path
    when /the my account page/
      account_path
    when /the admin dashboard/
      admin_path
    when /the user list page/
      admin_users_path
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
