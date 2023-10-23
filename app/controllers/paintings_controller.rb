class PaintingsController < ApplicationController
    def index
        @paintings = Painting.all
    end

    def show
        @painting = Painting.find(params[:id])
    end

    def new
        @painting = Painting.new
        @artists = Artist.all
        @galleries = Gallery.all
    end

    def create 
        @painting = Painting.create(painting_params)
        redirect_to @painting.artist
    end

    def destroy
        @painting = Painting.find(params[:id])
        @painting.destroy
    end

    private

    def painting_params
        params.require(:painting).permit(:name, :price, :artist_id, :gallery_id)
    end
end
