class Backend::ProductsController < BackendController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to backend_products_path(@product), flash: {success: '新增成功'}
    else
      flash.now[:notice] = '產品新增失敗'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      redirect_to backend_products_path(@product), flash: {success: '更新成功'}
    else
      flash.now[:notice] = '產品更新失敗'
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      flash.now[:notice] = '刪除成功'
    else
      flash.now[:notice] = '刪除失敗'
    end
  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :item_code, :start_rent, :end_rent)
  end

end
