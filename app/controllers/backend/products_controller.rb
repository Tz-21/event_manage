class Backend::ProductsController < BackendController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @products = current_user.products.joins('LEFT JOIN `rental_records` ON `rental_records`.`product_id` = `products`.`id` LEFT JOIN `clients` ON `clients`.`id` = `rental_records`.`client_id`').where("products.name LIKE ? OR products.item_code LIKE ? OR clients.ring_id like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").group(:id).page(params[:page])
    else
      @products = current_user.products.order('created_at DESC').page(params[:page])
    end
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to backend_products_path, flash: {success: '新增成功'}
    else
      flash.now[:error] = @product.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      redirect_to backend_products_path, flash: {success: '更新成功'}
    else
      flash.now[:notice] = @product.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to backend_products_path, flash: {success: '刪除成功'}
  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :item_code, :rent_status, :user_id)
  end

end
