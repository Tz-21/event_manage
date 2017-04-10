class Admin::ClientsController < AdminController
  before_action :find_client, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @clients = current_user.clients.where('name LIKE ? OR id_number LIKE ? OR mobile_phone LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page])
    else
      @clients = current_user.clients.order('created_at ASC').page(params[:page])
    end
  end

  def new
    @client = current_user.clients.new
  end

  def create
    @client = current_user.clients.new client_params
    if @client.save
      redirect_to admin_clients_path, flash: {success: '新增成功'}
    else
      flash.now[:notice] = @client.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
  end

  def update
    if @client.update_attributes client_params
      redirect_to admin_clients_path, flash: {success: '編輯成功'}
    else
       @client.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to admin_clients_path, flash: {success: '刪除成功'}
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
