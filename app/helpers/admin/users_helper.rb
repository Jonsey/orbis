module Admin::UsersHelper
  def users_table
    NiceTableHelper::NiceTable.new(@users).to_html(%w(login email last_login_at)) do |row|
      [
       row.login,
       row.email,
       row.last_login_at,
       link_to('show', admin_user_path(row.id)),
       link_to('edit', edit_admin_user_path(row.id)),
       link_to('del', { :action => :destroy, :id => row }, :method => :delete)
      ]
    end

  end

end
