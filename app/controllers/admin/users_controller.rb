class Admin::UsersController < AdminController
  before_action :find_user

  def update
    if @user.update_attributes user_params
      redirect_to admin_clients_path, flash: {succes: '新增成功'}
    else
      flash.now[:notice] = '資料更新失敗'
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :tax_id, :phone, :role, :email)
  end
end
