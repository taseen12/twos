class MyOrderController < ApplicationController
  #before_action :set_user
  before_action :check_access
  def index

    #@user = User.includes(:orders).find(params[:user_id])
    @orders = current_user.orders


    @user=User.find(current_user.id)



  end
  #def set_user
  # @user = User.find(params[:id])
    #puts session[:user_id]
    # @user = User.find_by_id(session[:user_id])

  #end
  private
  def check_access
    #unless current_user.admin?
    unless user_signed_in? && current_user.admin?

      #unless @User.admin.find_by(id: session[:user_id])
      redirect_to new_user_session_path, notice: "Please log in", alert: "You are not authorized to view this page"
    end



  end
end
