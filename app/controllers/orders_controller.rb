class OrdersController < ApplicationController
  #belongs to = user
  before_action :check_access
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    #@user = User.find(params[:user_id])
    #@orders = @user.orders
    @orders = Order.all
    #@user = User.includes(:orders).find(params[:user_id])
    #@orders = @user.orders
  end

  def show
  end

  # GET /orders/new
  def new

    #@order = Order.new
    car = Product.find(params[:product_id])

    session[:product_id]=car.id

    #orion=Order.find(params[:order_id])
    #session[:order_id]=orion.id
    #@car_name = car.model
    # person = User.find_by(id: session[:user_id])
    #@car_name = car.model
    #session[:user_id] =person.id

     @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end
  def create
  # POST /orders or /orders.json

   @order = Order.new(order_params)

  @order.product_id = session[:product_id]


  #order = current_user.orders.build(order_params)

  @order.user_id = current_user.id
  #@cart = Cart.new(cart_params)

  #puts "SSSSSSSSSSSS"
  #puts @order.product_id
  #puts current_user.id

  #puts "SSSSSSSSSSSSS"
  @order.add_order_column_to_product
  respond_to do |format|
    if @order.save
      #@order.addcar_id = session[:addcar_id]
      #session[:addcar_id] = nil
      format.html { redirect_to order_url(@order), notice: "order is successfully done." }
      format.json { render :show, status: :created, location: @order }
      # else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type, :quantity)
    end
  def check_access
    #unless current_user.admin?
    unless user_signed_in?
      #&& current_user.admin?
      #unless @User.admin.find_by(id: session[:user_id])
      redirect_to new_user_session_path, alert: "You are not authorized to view this page"
    end
  end
  end
