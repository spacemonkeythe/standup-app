class StandupsController < ApplicationController
  before_action :set_standup, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :authorized_user, :only => [:edit, :update, :destroy]

  respond_to :html

  def index
    @standups = Standup.newest_first.paginate(:per_page => 5, :page => params[:page])
    respond_with(@standups)
  end

  def show
    @prev = Standup.where("(id < ?) AND (user_id = ?)", @standup.id, @standup.user_id).last 
    respond_with(@standup, @prev)
  end

  def new
    @standup = current_user.standups.build
    respond_with(@standup)
  end

  def edit
  end

  def create
    @standup = current_user.standups.build(standup_params)
    @standup.save
    respond_with(@standup)
  end

  def update
    @standup.update(standup_params)
    respond_with(@standup)
  end

  def destroy
    @standup.destroy
    respond_with(@standup)
  end

  private
  def set_standup
    @standup = Standup.find(params[:id])
  end

  def standup_params
    params.require(:standup).permit(:title, :content, tasks_attributes: [:id, :content, :done, :_destroy])
  end

  def authorized_user
    @standup = current_user.standups.find_by(id: params[:id])
    redirect_to standups_path, notice: "Not authorized to edit this standup" if @standup.nil?
  end

end
