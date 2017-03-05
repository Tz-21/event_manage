class Admin::FirmsController < AdminController
  before_action :find_firm, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @firms = User.where('name LIKE ? OR tax_id LIKE ? OR phone LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page])
    else
      @firms = User.order('created_at DESC').page(params[:page])
    end
  end

  def new
    @firm = User.new
  end

  def create
    @firm = User.new firm_params
    if @firm.save
      redirect_to admin_firms_path, flash: {success: '新增成功'}
    else
      flash.now[:error] = @firm.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    if @firm.update_attributes firm_params
      redirect_to admin_firms_path, flash: {success: '更新成功'}
    else
      flash.now[:error] = @firm.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @firm.destroy
    redirect_back(fallback_location: admin_firms_path)
  end

  private

  def firm_params
    params.require(:user).permit(:name, :tax_id, :phone, :email, :password, :password_confirmation)
  end

  def find_firm
    @firm = User.find_by(id: params[:id])
  end
end

