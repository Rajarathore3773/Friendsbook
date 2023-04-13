class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]


   def index
    # @users = User.all
    @users = User.where('id != ?' , current_user.id)
  end
   
  def show

  end

 def new
   @users = User.new
 end

 def create 
   @users = User.new(user_params)
   if @users.save
    redirect_to @users
   else
    render :new, status: :unprocessable_entity
   end
 end


    private

    def user_params
      params.require(:user).permit( :full_name, :username, :phone_number)
    end
  
    def set_user
      @user = User.find_by(id: params[:id])
    end
end
