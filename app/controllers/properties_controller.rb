class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @properties = Property.paginate(page: params[:page], per_page: 5)    
    end

    def new
        @property = Property.new
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
        @property = Property.new(property_params)
        @property.user = User.first
        if @property.save
            flash[:notice] = "Property was created successfully."
            redirect_to @property
          else
            render 'new'
          end
    end

    def property_params
        params.require(:property).permit(:photo, :address, :description)  
    end

    def set_property
        @property = Property.find(params[:id])
    end
end