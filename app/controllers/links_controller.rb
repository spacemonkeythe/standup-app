class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @links = Link.all
    respond_with(@links)
  end

  def show
    @link.user = current_user
    respond_with(@link)
  end

  def new
    @link = current_user.links.build
    respond_with(@link)
  end

  def edit
  end

  def create
    @link = current_user.links.build(link_params)
    @link.save
    respond_with(@link)
  end

  def update
    @link.update(link_params)
    respond_with(@link)
  end

  def destroy
    @link.destroy
    respond_with(@link)
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :content)
    end
end
