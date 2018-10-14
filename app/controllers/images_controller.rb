class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :destroy]
  
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.new(post_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end


  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
   
  def post_params
    params.require(:image).permit(:image)
  end
  
  def set_image
      @image = Image.find(params[:id])
  end
end
