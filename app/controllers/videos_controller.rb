class VideosController < ApplicationController
  before_action :set_video, only:[:show, :destroy, :edit, :update]

  def index
    @all_videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    require 'json'
    require 'open-uri'
    @video = Video.new(video_params)
    @results = @video.parse_video_url(@video.videokey)
    if @results [:provider] == "youtube"
      video_enriched = Yt::Video.new id: @results [:id]
      @video.video_title = video_enriched.title
      @video.videokey = @results [:id]
      @video.video_provider = @results [:provider]
    elsif @results [:provider] == "vimeo"
      video_enriched = "https://api.vimeo.com/videos/#{@results [:id]}?access_token=6aa8dffa858d34fd3658f6632fd9b5fb"
      parsed_data = URI.open(video_enriched).read
      vimeo_data = JSON.parse(parsed_data)

      @video.video_title = vimeo_data['name']
      @video.videokey = @results [:id]
      @video.video_provider = @results [:provider]
    else
      flash[:alert] = "Not an accepted format"
    end
    if @video.save
      flash[:alert] = "Video created"
      redirect_to video_path(@video)
    else
      flash[:alert] = "Video rejected"
      render 'new'
    end

  end

  def update
  end

  def edit
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(
      :videokey,
      :video_language,
      :video_title,
      :rating,
      :video_provider)
  end



end
