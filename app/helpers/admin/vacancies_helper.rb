module Admin::VacanciesHelper

  def render_vacancy_tabs
    returning [] do |tabs|
      tabs << %(#{li_tab 'Drafts', admin_vacancies_path(:status => :draft)}) unless current_user.is_a?(Candidate)
      tabs << %(#{li_tab 'Awaiting approval', admin_vacancies_path(:status => :awaiting_approval)}) unless current_user.is_a?(Candidate)
      tabs << %(#{li_tab current_user.is_a?(Candidate) ? 'Hot Vacancies' : 'Live', admin_vacancies_path(:status => :live)})
      tabs << %(#{li_tab 'Archived', admin_vacancies_path(:status => :archived)}) unless current_user.is_a?(Candidate)
    end

  end

  def vacancies_table
    returning [] do |arr|
      arr << %(<table class="tbl-standard">)
      arr << %(<tr>)
      arr << %(<th>#{check_box_tag('select-all',nil, false, :id => 'checkboxall')}</th>)
      arr << %(<th>Role</th>)
      arr << %(<th>Location</th>)
      arr << %(<th>Salary</th>)
      arr << %(<th>Category</th>)
      arr << %(<th>Staff Contact</th>) unless @status == "draft"
      arr << %(<th>Client</th>) if current_user.is_a?(Staff) || current_user_is_admin?
      arr << %(<th width='105px'></th>)
      arr << %(</tr>)
      arr << vacancy_rows(@vacancies)
      arr << %(</table>)
    end
  end

  def vacancy_update_status_buttons(form_builder)
    case form_builder.object.status
      when 'awaiting_approval' then  form_builder.submit "Approve"
      when 'draft' then form_builder.submit "Submit for approval"
      when 'live' then form_builder.submit "Archive"
    end
  end


private
  def vacancy_rows(vacancies)
    returning [] do |arr|
      vacancies.each_with_index do |row, row_index|
        arr << %(<tr class="#{row_index % 2 == 0 ? 'even': 'odd'}">\r\n)
        arr << %(<td>#{check_box_tag("vacancy_ids[]", row.id, false, :id => "vacancy_#{row.id}", :class => 'checkall')}</td>\r\n)
        arr << %(<td>#{row.role}</td>\r\n)
        arr << %(<td>#{row.location}</td>\r\n)
        arr << %(<td>#{row.salary}</td>\r\n)
        arr << %(<td>#{row.category.to_s}</td>\r\n)
        arr << %(<td>#{mail_to row.try(:staff).try(:email), row.try(:staff)}</td>\r\n) unless @status == "draft"
        arr << %(<td>#{mail_to row.try(:client).try(:email), row.try(:client) }</td>\r\n) if current_user.is_a?(Staff) || current_user_is_admin?
        arr << %(<td>#{image_link_to('icons/ico-view.png', 'preview', vacancy_path(row.id),{ }, :popup => [ 'Preview' , 'height=764,width=973,resizable=yes,scrollbars=yes'])})
        arr << %(  #{image_link_to('icons/ico-edit.png','edit', edit_admin_vacancy_path(row.id)) if show_edit_vacancy})
        arr << %(  #{image_link_to('icons/ico-del.png', 'delete', { :action => :destroy, :id => row }, nil, :method => :delete) if show_delete_vacancy}</td>)
        arr << %(</tr>\r\n)
      end
    end
  end

  def show_edit_vacancy
    return false if current_user.is_a?(Client) && (@status.to_sym == :awaiting_approval)
    true
  end

  def show_delete_vacancy
    return true if @status.to_sym == :draft || :archived || current_user_is_admin? || session[:access_rights].include?("admin/vacancies/destroy")
    false
  end


end
