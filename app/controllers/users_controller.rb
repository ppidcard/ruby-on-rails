class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] = "Welcome to the AWS #{@user.username}, you have successfully signed up"
          redirect_to properties_path
        else
          render 'new'
        end
      end
    
    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :status)
    end
    def set_user
        @user = User.find(params[:id])
    end

end