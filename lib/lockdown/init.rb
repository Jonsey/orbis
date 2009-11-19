Lockdown::System.configure do

  options[:session_timeout_method] = :clear_authlogic_session
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Public Access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_permission(:login).
    with_controller(:user_sessions).
    only_methods(:new, :create)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Protected Access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_permission(:my_account).
    with_controller(:users).
    only_methods(:show).
      to_model(:user).where(:id).equals(:current_user_id)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Restricted access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_permission(:create_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:new, :create)

  set_permission(:edit_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:edit, :update).
      to_model(:vacancy).where(:editor_ids).includes(:current_user_id)

  set_permission(:list_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:index)

  set_permission(:view_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:show)

  set_permission(:delete_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:destroy)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Built-in user groups
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_public_access :login
  set_protected_access :view_vacancies, :my_account

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Define user groups
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_user_group(:clients, :create_vacancies, :list_vacancies, :edit_vacancies, :delete_vacancies)
  set_user_group(:candidates, :list_vacancies)
end
