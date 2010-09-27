module Admin::ClientsHelper
  def clients_table
    returning [] do |arr|
      arr << %(<table class="tbl-standard">)
      arr << %(<tr>)
      arr << %(<th>Company name</th>)
      arr << %(<th>First name</th>)
      arr << %(<th>Last name</th>)
      arr << %(<th>Email</th>)
      arr << %(<th>Telephone</th>)
      arr << %(<th width='105px'></th>)
      arr << %(</tr>)
      arr << client_rows(@clients)
      arr << %(</table>)
    end
  end

private
  def client_rows(users)
    returning [] do |arr|
      users.each_with_index do |row, row_index|
        arr << %(<tr class="#{row_index % 2 == 0 ? 'even': 'odd'}">)
        arr << %(<td>#{h row.company_name}</td>)
        arr << %(<td>#{h row.firstname}</td>)
        arr << %(<td>#{h row.lastname}</td>)
        arr << %(<td>#{h row.email}</td>)
        arr << %(<td>#{h row.telephone}</td>)
        arr << %(<td>#{image_link_to('icons/ico-view.png', 'view', admin_client_path(row.id))})
        arr << %(  #{image_link_to('icons/ico-edit.png','edit', edit_admin_client_path(row.id))})
        arr << %(  #{image_link_to('icons/ico-del.png', 'delete', { :action => :destroy, :id => row }, nil, :method => :delete)}</td>)
        arr << %(</tr>)
      end
    end
  end
end
