class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = "Logged in successfully"
          redirect_to user
        else
          flash.now[:alert] = "There was something wrong with your login details"
          render 'new'
        end
    end

    def omniauth
      user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
        u.username = request.env['omniauth.auth'][:info][:first_name]
        u.email = request.env['omniauth.auth'][:info][:email]
        u.password = SecureRandom.hex(15)
      end
      if user.valid?
        session[:user_id] = user.id
        redirect_to user
      else
        redirect_to login_path
      end
    end
  
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end