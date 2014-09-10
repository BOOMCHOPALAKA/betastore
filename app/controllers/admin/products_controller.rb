class Admin::ProductsController < Admin::BaseController

  def index
    if logged_in?
      @products = Product.order('name')
    else
      redirect_to admin_login_path, alert: 'Please log in to continue'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path,
        success: "Product ##{@product.id} was created"
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path,
        success: "Product ##{@product.id} was updated"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:success] = "Product ##{@product.id} was deleted"
    else
      flash[:danger] = "Product ##{@product.id} could not be deleted"
    end
    redirect_to admin_products_path
  end

protected
  def product_params
    params.require(:product).permit(:name, :price)
  end
end

#################
#WHAT I HAD BEFORE
#################

# class Admin::ProductsController < ApplicationController
#   #SEE LINE 7 FOR OTHER VARIANT OF LAYOUT
#   layout 'admin'

#   before_action :require_login

#   #DON'T NEED THIS ANYMORE... SEE INDEX FUNC BELOW AS WELL AS SECURITY SLIDES
#   # def index
#   #   if logged_in?
#   #     @products = Product.order('name').to_a
#   #   else
#   #     redirect_to admin_login_path, alert: 'Please log in to continue'
#   #   end
#   # end

#     def index
#       @products = Product.order('name').to_a
#     end


#   def show
#     # params is a method that returns a hash
#     #params[:id]
#     #SEE http://pjb3.github.io/back-end-web-development/03_sql_models_routing_controllers/routing#22
#     #This is the answer to ex 1.
#     @product = Product.find(params[:id])
#   end

#   def new
#     @product = Product.new
#   end

#   def create
#     @product = Product.new(product_params)
#     if @product.save
#       redirect_to admin_products_path,
#         success: "Product #{@product.id} was created"
#     else
#       render 'new'
#     end
#   end

#   def update
#     @product = Product.find(params[:id])
#       if @product.update(product_params)
#       redirect_to admin_products_path,
#         success: "Product ##{@product.id} was updated"
#       else
#       render 'edit'
#       end
#   end

#   def edit
#     @product = Product.edit(params[:id])
#   end

#   def destroy
#     @product = Product.find(params[:id])
#     @product.destroy
#     redirect_to admin_products_path, notice: "Product #{@product_id} has been deleted"
#   end

#   # protected means these methods can't be called as an action...
#   # They are used by actions
#   protected

#   #DO NOT USE ANYMORE... SEE NEW product_params BELOW, THIS WORKS WITH BRAKEMAN
#   # def product_params
#   #   params.require(:product).permit!
#   # end

#   def product_params
#     params.require(:product).permit(:name, :price)
#   end

#   def logged_in?
#     session[:user_id].present?
#   end

#   def require_login
#     unless logged_in?
#       redirect_to admin_login_path, danger: 'Please log in to continue'
#   end
# end

# end