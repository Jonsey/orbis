module Admin::VacanciesHelper

  def vacancies_table
    returning [] do |arr|
      arr << %(<table>)
      arr << %(<tr>)
      arr << %(<th>#{check_box_tag('select-all')}</th>)
      arr << %(<th>Title</th>)
      arr << %(<th>Salary</th>)
      arr << %(<th width='80px'></th>)
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
        arr << %(<td>#{link_to('view', admin_vacancy_path(row.id))})
        arr << %(  #{link_to('edit', edit_admin_vacancy_path(row.id)) if show_edit_vacancy})
        arr << %(  #{link_to('delete', { :action => :destroy, :id => row }, :method => :delete) if show_delete_vacancy}</td>)
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
