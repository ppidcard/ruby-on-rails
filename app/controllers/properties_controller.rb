class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :require_seller, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
    end

    def index
        if params[:suburb_id]
        @suburb = Suburb.find(params[:suburb_id])
        @properties = @suburb.properties.paginate(page: params[:page], per_page: 5)    
        else
            @properties = Property.paginate(page: params[:page], per_page: 5)    
        end
    end

    def new
        if params[:suburb_id]
            @suburb = Suburb.find(params[:suburb_id])
            @property = @suburb.properties.build
        else
            @property = Property.new
        end
    end

    def edit
    end

    def update
        if @property.update(property_params)
            flash[:notice] = "Property was updated successfully."
            redirect_to @property
          else
            render 'edit'
          end
    end

    def create
        if params[:suburb_id]
            @suburb = Suburb.find(params[:suburb_id])
            @property = Property.new(property_params)
            @property.suburb_ids = [@suburb.id]
            @property.user = current_user
        else
            @property = Property.new(property_params)
            @property.user = current_user
        end

        if @property.save
            flash[:notice] = "Property was created successfully."
            redirect_to @property
          else
            render 'new'
          end
    end

    def destroy
        @property.destroy
        redirect_to properties_path
    end
    private
    def property_params
        params.require(:property).permit(:photo, :address, :description, suburb_ids:[])  
    end

    def set_property
        @property = Property.find(params[:id])
    end

    def require_seller
        if !logged_in? 
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        elsif current_user.status != "seller"
            flash[:alert] = "You must be an agent to perform that action"
            redirect_to login_path
        end
    end

    def require_same_user
        if current_user != @property.user
            flash[:alert] = "You can only edit or delete your own property"
        redirect_to @property
        end
    end
end