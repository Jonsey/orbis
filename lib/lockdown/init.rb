Lockdown::System.configure do

  options[:session_timeout_method] = :clear_authlogic_session
  options[:access_denied_path] = "/unauthorised"
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Public Access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_permission(:login).
    with_controller(:user_sessions).
    and_controller(:client_sessions).
    and_controller(:candidate_sessions).
    only_methods(:new, :create)

  set_permission(:static).
    with_controller(:static)

  set_permission(:public).
    with_controller(:home).
    and_controller(:clients).only_methods(:index).
    and_controller(:candidates).only_methods(:index).
    and_controller(:contact).
    and_controller(:vacancies).only_methods(:index, :show)



  set_permission(:signup).
    with_controller(:clients).
    and_controller(:candidates).
    only_methods(:new, :create)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Protected Access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_permission(:logout).
    with_controller(:user_sessions).
    only_methods(:destroy)

  set_permission(:my_client_account).
    with_controller(:admin__clients).
    only_methods(:show, :edit).
    to_model(:client).where(:client_id).equals(:current_user_id)

  set_permission(:my_candidate_account).
    with_controller(:admin__candidates).
    only_methods(:show, :edit).
    to_model(:candidate).where(:candidate_id).equals(:current_user_id)

  set_permission(:my_staff_account).
    with_controller(:admin__staffs).
    only_methods(:show, :edit).
    to_model(:staff).where(:staff_id).equals(:current_user_id)

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
    only_methods(:edit, :update)
 #   to_model(:vacancy).where(:editor_ids).includes(:current_user_id)

  set_permission(:list_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:index)

  set_permission(:view_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:show)

  set_permission(:delete_vacancies).
    with_controller(:admin__vacancies).
    only_methods(:destroy)

  set_permission(:manage_staff).
    with_controller(:admin__staffs)

  set_permission(:manage_clients).
    with_controller(:admin__clients)

  set_permission(:manage_candidates).
    with_controller(:admin__candidates)

  set_permission(:manage_documents).
    with_controller(:admin__documents)

  set_permission(:manage_categories).
    with_controller(:admin__categories)

  set_permission(:view_documents).
    with_controller(:admin__documents).
    only_methods(:show, :index)

  set_permission(:apply_for_vacancies).
    with_controller(:vacancies).
    only_methods(:apply)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Built-in user groups
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_public_access :login, :signup, :static, :public
  set_protected_access  :view_vacancies,:logout
#,  :edit_vacancies,  :delete_vacancies,  :create_vacancies,  :list_vacancies,  :manage_clients,  :manage_candidates,  :manage_documents,  :manage_categories,  :my_client_account,  :my_candidate_account,  :my_staff_account,  :register_staff, :apply_for_vacancies


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Define user groups
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  set_user_group(:administrators, :manage_categories)
  set_user_group(:clients, :my_client_account, :create_vacancies,:list_vacancies, :edit_vacancies, :delete_vacancies, :view_documents, :apply_for_vacancies)
  set_user_group(:candidates, :my_candidate_account, :list_vacancies, :apply_for_vacancies)
  set_user_group(:staffs, :my_staff_account, :list_vacancies, :edit_vacancies,:register_staff, :manage_staff, :manage_documents, :manage_clients, :manage_candidates, :apply_for_vacancies)
end
