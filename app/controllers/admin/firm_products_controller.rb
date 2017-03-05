class Admin::FirmProductsController < AdminController
  before_action :find_firm
  before_action :find_firm_product, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @firm_products = @firm.products.where('name LIKE ? OR item_code LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page])
    else
      @firm_products = Product.order('created_at DESC').page(params[:page])
    end
  end

  def new
    @firm_product = @firm.products.new
  end

  def create
    @firm_product = @firm.products.new firm_product_params
    if @firm_product.save
      redirect_to admin_firm_firm_products_path, flash: {success: '新增成功'}
    else
      flash.now[:error] = @firm_product.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    if @firm_product.update_attributes firm_product_params
      redirect_to admin_firm_firm_products_path, flash: {success: '更新成功'}
    else
      flash.now[:error] = @firm_product.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def destroy
    @firm_product.destroy
    redirect_back(fallback_location: admin_firm_firm_products_path)
  end

  private

  def firm_product_params
    params.require(:product).permit(:name, :item_code, :usre_id)
  end

  def find_firm_product
    @firm_product = @firm.products.find_by(id: params[:id])
  end

  def find_firm
    @firm = User.find_by(id: params[:firm_id])
  end

end
