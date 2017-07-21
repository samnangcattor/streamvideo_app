class VideosController < ApplicationController
  include Rstreamor
  def index
  end

  def show
    @video = Video.find params[:id]
    stream @video.profile unless @video
  end

  def create
    @video = Video.new video_params
    if @video.save
      redirect_to @video
    else
      render :index
    end
  end

  private
  def video_params
    params.require(:video).permit(:profile)
  end
end
