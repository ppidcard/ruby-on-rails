class PropertiesController < ApplicationController
    def show
        @property = Property.find(params[:id])
    end

    def index
        @properties = Property.paginate(page: params[:page], per_page: 5)    
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(property_params)
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
end