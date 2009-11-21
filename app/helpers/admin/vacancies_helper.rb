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
      arr << %(<table>)
      arr << %(<tr>)
      arr << %(<th>#{check_box_tag('select-all')}</th>)
      arr << %(<th>Title</th>)
      arr << %(<th>Salary</th>)
      arr << %(<th width='105px'></th>)
      arr << %(</tr>)
      arr << vacancy_rows(@vacancies)
      arr << %(</table>)
    end
  end

private
  def vacancy_rows(vacancies)
    returning [] do |arr|
      vacancies.each_with_index do |row, row_index|
        arr << %(<tr class="#{row_index % 2 == 0 ? 'even': 'odd'}">)
        arr << %(<td>#{check_box_tag(row.id)}</td>)
        arr << %(<td>#{row.title}</td>)
        arr << %(<td>#{row.salary}</td>)
        arr << %(<td>#{image_link_to('icons/ico-view.png', 'view', admin_vacancy_path(row.id))})
        arr << %(  #{image_link_to('icons/ico-edit.png','edit', edit_admin_vacancy_path(row.id)) if show_edit_vacancy})
        arr << %(  #{image_link_to('icons/ico-del.png','delete', { :action => :destroy, :id => row }, :method => :delete) if show_delete_vacancy}</td>)
        arr << %(</tr>)
      end
    end
  end

  def show_edit_vacancy
    @status.to_sym == :draft
  end

  def show_delete_vacancy
    @status.to_sym == (:draft || :archived)
  end


end
