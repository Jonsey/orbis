module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /my candidate account page/
      edit_admin_candidate_path(controller.session[:current_user_id])
    when /my staff account page/
      edit_admin_staff_path(controller.session[:current_user_id])
    when /my client account page/
      edit_admin_client_path(controller.session[:current_user_id])
    when /the unauthorised access page/
      unauthorised_access_path
    when /the client signup page/
      client_registration_path
    when /the candidate signup page/
      candidate_registration_path
    when /the staff registration page/
      staff_registration_path
    when /the login page/
      login_path
    when /the candidate login page/
      candidate_login_path
    when /the admin dashboard/
      admin_path
    when /the admin pages list/
      admin_pages_path
    when /the new vacancy page/
      new_admin_vacancy_path
    when /the admin vacancies page/
      admin_vacancies_path
    when /the draft vacancies page/
      admin_vacancies_path('status' => 'draft')
    when /the vacancies awaiting approval page/
      admin_vacancies_path('status' => 'awaiting_approval')
    when /the live vacancies page/
      admin_vacancies_path('status' => 'live')
    when /the archived vacancies page/
      admin_vacancies_path('status' => 'archived')
    when /the edit vacancy page for "([^\"]*)"$/i
      edit_admin_vacancy_path(Vacancy.find_by_role($1))
    when /the show vacancy page for "([^\"]*)"$/i
      admin_vacancy_path(Vacancy.find_by_role($1))

    when /^#{capture_model}(?:'s)? page$/
      path_to_pickle $1
    when /^#{capture_model}(?:'s)? #{capture_model}(?:'s)? page$/   # eg. the forum's post's page
      path_to_pickle $1, $2

    when /^#{capture_model}(?:'s)? #{capture_model}'s (.+?) page$/  # eg. the forum's post's comments page
      path_to_pickle $1, $2, :extra => $3                           #  or the forum's post's edit page

    when /^#{capture_model}(?:'s)? (.+?) page$/                     # eg. the forum's posts page
      path_to_pickle $1, :extra => $2                               #  or the forum's edit page

    when /^the (.+?) page$/                                         # translate to named route
      send "#{$1.downcase.gsub(' ','_')}_path"

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
