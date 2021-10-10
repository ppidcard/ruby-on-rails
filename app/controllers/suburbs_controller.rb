class SuburbsController < ApplicationController
    def new
        @suburb = Suburb.new
    end

    def create
        @suburb = Suburb.new(suburb_params)
        if @suburb.save
            flash[:notice] = "Suburb was successfully created"
            redirect_to @suburb
        else
            render 'new'
        end
    end

    def edit

    end

    def update

    end

    def index
        @suburbs = Suburb.paginate(page: params[:page], per_page: 5)    
    end

    def show
        @suburb = Suburb.find(params[:id])
        @properties = @suburb.properties.paginate(page: params[:page], per_page: 5)
    end

    private
    def suburb_params
        params.require(:suburb).permit(:name)  
    end

end