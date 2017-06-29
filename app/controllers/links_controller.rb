class LinksController < ApplicationController
  def create
    @link = Link.new(link_params)
    if @link.save
      render json: { short_url: "#{request.base_url}/#{@link.slug}" }
    else
      render json: { errors: @link.errors, status: :unprocessable_entity }
    end
  end

  def get_link
    @link = Link.find_by(slug: params[:slug])
    if @link
      redirect_to @link.url
    else
      render 'link_error'
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
