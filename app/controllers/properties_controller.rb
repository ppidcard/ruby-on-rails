class PropertiesController < ApplicationController
    def show
        @property = Property.find(params[:id])
    end

    def index
        @properties = Property.paginate(page: params[:page], per_page: 5)    
    end
end