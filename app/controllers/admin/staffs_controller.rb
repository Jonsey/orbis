class Admin::StaffsController < ApplicationController
  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(params[:staff])
    @staff.user_groups << UserGroup.find_by_name('Staffs')
    if @staff.save
      add_lockdown_session_values
      flash[:notice] = "Account created.."
      redirect_to admin_vacancies_path
    else
      render :action => 'new'
    end
  end
end
