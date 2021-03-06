class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :destroy]
  
  def new
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(post_params)
    respond_to do |format|
      if @picture.save
        MakeSketch.call(@picture.image_url(:transformed))
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def index
    @pictures = Picture.all
  end
  
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
   
  def post_params
    params.require(:picture).permit(:image)
  end
  
  def set_picture
      @picture = Picture.find(params[:id])
  end
end
