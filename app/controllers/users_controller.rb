class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create

    end

    def set_user
        @user = User.find(params[:id])
    end

end