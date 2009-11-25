Lockdown::System.configure do

  options[:session_timeout_method] = :clear_authlogic_session
  options[:access_denied_path] = "/unauthorised"
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Public Access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_permission(:login).
    with_controller(:user_sessions).
    only_methods(:new, :create)

  set_permission(:logout).
    with_controller(:user_sessions).
    only_methods(:destroy)

  set_permission(:signup).
    with_controller(:clients).
    and_controller(:candidates).
    only_methods(:new, :create)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Protected Access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_permission(:my_account).
    with_controller(:users).
    only_methods(:show, :edit).
      to_model(:user).where(:id).equals(:current_user_id)

  set_permission(:register_staff).
    with_controller(:admin__staffs).
    only_methods(:new, :create)


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
  set_public_access :login, :signup
  set_protected_access :view_vacancies, :my_account, :logout

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Define user groups
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_user_group(:clients, :create_vacancies, :list_vacancies, :edit_vacancies, :delete_vacancies)
  set_user_group(:candidates, :list_vacancies)
  set_user_group(:staffs, :list_vacancies, :edit_vacancies, :register_staff)
end
