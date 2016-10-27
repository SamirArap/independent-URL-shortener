class UrlsController < ApplicationController

  def index
    @urls = Url.all
    @url = Url.new
  end


  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to root_path, notice: @url.display_url
    else
      redirect_to root_path, alert: "Wrong URL!"
    end

  end

  def redirect
    @id = params[:id]
    if @id != nil
      @url = Url.find_by(short_id: params[:id])
      if @url != nil
        redirect_to @url.original_url
      end

    end
  end

  private
  def url_params
    params.require(:url).permit(:original_url, :short_id)
  end
end
