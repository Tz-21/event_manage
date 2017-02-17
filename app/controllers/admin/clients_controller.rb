class Admin::ClientsController < AdminController
  before_action :find_client, only: [:edit, :update, :destroy]

  def index
    @clients = current_user.clients.order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    @client = current_user.clients.new
  end

  def create
    @client = current_user.clients.new(client_params)
    if @client.save
      redirect_to admin_clients_path, flash: {success: '新增成功'}
    else
      flash.now[:notice] = '客戶新增失敗'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @client.update_attributes(client_params)
      redirect_to admin_clients_path(@client), flash: {success: '編輯成功'}
    else
      render 'edit'
    end
  end

  def destroy
    if @client.destroy
      flash.now[:notice] = '刪除成功'
    else
      flash.now[:notice] = '刪除失敗'
    end
    redirect_to admin_clients_path @client
  end

  private

  def find_client
    @client = Client.find_by id: params[:id]
  end

  def client_params
    params.require(:client).permit(:name, :id_number, :mail, :company,
                                   :mobile_phone, :borrow_status, :ring_id,
                                   :id_photo, :user_id
                                   )
  end
end
