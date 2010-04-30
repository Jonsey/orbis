module Admin::UsersHelper
  def users_table
    returning [] do |arr|
      arr << %(<table class="tbl-standard">)
      arr << %(<tr>)
      arr << %(<th>First name</th>)
      arr << %(<th>Last name</th>)
      arr << %(<th>Email</th>)
      arr << %(<th>Telephone</th>)
      arr << %(<th width='105px'></th>)
      arr << %(</tr>)
      arr << user_rows(@users)
      arr << %(</table>)
    end
  end

private
  def user_rows(users)
    returning [] do |arr|
      users.each_with_index do |row, row_index|
        arr << %(<tr class="#{row_index % 2 == 0 ? 'even': 'odd'}">)
        arr << %(<td>#{row.firstname}</td>)
        arr << %(<td>#{row.lastname}</td>)
        arr << %(<td>#{row.email}</td>)
        arr << %(<td>#{row.telephone}</td>)
        arr << %(<td>#{image_link_to('icons/ico-view.png', 'view', admin_user_path(row.id))})
        arr << %(  #{image_link_to('icons/ico-edit.png','edit', edit_admin_user_path(row.id))})
        arr << %(  #{image_link_to('icons/ico-del.png', 'delete', { :action => :destroy, :id => row }, nil, :method => :delete)}</td>) if display_delete?(row)
        arr << %(</tr>)
      end
    end
  end

def display_delete?(user)
  return (!user.kind_of?(Client) && !user.kind_of?(Candidate) && !user.kind_of?(Staff))
end


end
