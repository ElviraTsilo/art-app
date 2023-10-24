class GalleriesController < ApplicationController
    def index
        @galleries = Gallery.all
    end

    def show
        @gallery = Gallery.find(params[:id])
    end

    def new
        @gallery = Galery.new
    end

    def create 
        @galery = Galery.create(gallery_params)

        redirect_to @galery
    end

    def edit
        @galery = Galery.find(params[:id])
    end

    def update
        @galery = Galery.find(params[:id])
        @galery.update(galery_params)

        redirect_to @galery
    end

    def destroy
        @galery = Galery.find(params[:id])
        @galery.destroy
    end

    private

    def galery_params
        params.require(:galery).permit(:name, :location)
    end
end
