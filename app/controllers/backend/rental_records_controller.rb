class Backend::RentalRecordsController <BackendController
  before_action :find_product

  def new
    @rental_record = @product.rental_records.new
  end

  def create
    if @rental_record = @product.rental_records.create_with_client(rental_record_params, params[:ring_id])
      Client.find_by(ring_id: params[:ring_id]).product_full!
      @product.rent!
      redirect_to backend_products_path, flash: {success: '租借成功'}
    else
      flash.now[:notice] = @rental_record.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def destroy
    rental_record = @product.rental_records.find_by(id: params[:id])
    rental_record.client.product_empty!
    rental_record.destroy
    @product.free!
    redirect_to backend_products_path, flash: {success: '歸還成功'}
  end

  private

  def rental_record_params
    params.require(:rental_record).permit(:start_rent, :end_rent, :client_id)
  end

  def find_product
    @product = Product.find_by(id: params[:product_id])
  end

end
