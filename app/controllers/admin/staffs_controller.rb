class Admin::StaffsController < ApplicationController

  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(params[:staff])
    @staff.user_groups << UserGroup.find_by_name('Staffs')
    if @staff.save
      @staff.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @staff = Staff.find_by_id(params[:id])
  end

 def show
    @staff = Staff.find_by_id(params[:id])
  end

  def update
    @staff = Staff.find_by_id(params[:id])
    if @staff.update_attributes(params[:staff])
      flash[:success] = "Account updated!"
      if current_user.id == @staff.id
        redirect_to edit_admin_staff_url(@staff)
      else
        redirect_to admin_staffs_url
      end
    else
      render :action => :edit
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    if @staff.has_vacancies_awaiting_approval?
      flash[:error] = "This staff member has vacancies awaiting approval.  Please re-assign the vacancies before deleting this account."
    elsif @staff.has_live_vacancies?
      flash[:error] =  "This staff member has live vacancies. Please re-assign or archive the vacancies before deleting this account."
    else
      @staff.destroy
      flash[:notice] = "Staff account was removed."
    end
    redirect_to admin_staffs_url
  end
end
