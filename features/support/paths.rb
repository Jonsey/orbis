module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
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
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
