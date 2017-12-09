class OrderItemsController < ApplicationController

  def create
    @order_items = current_order.order_items
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
    flash[:notice] = "Product added to cart"
    session[:order_id] = @order.id
    respond_to do |format|
        format.html { redirect_to '/' }
        format.js
      end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @account = Account.find(current_user.id)
    @order_items = current_order.order_items
    @previous_orders = current_user.previous_orders
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    respond_to do |format|
        format.html { redirect_to '/cart' }
        format.js
      end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
