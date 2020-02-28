class UsersController < ApplicationController
  before_action :redirect_if_signed_in

    def new
        @user = User.new(user_params)
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to root_path
        else 
            flash[:alert] = @user.errors.full_messages.join(", ")
            render :new
        end 


    end 

    private
        def user_params
            params.require(:user).permit(:email, :password)
        end 
end
