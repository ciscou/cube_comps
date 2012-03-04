class EntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_competition

  respond_to :html

  def index
    @entries = @competition.entries.includes(:user)
  end

  def new
    @entry = current_user.entries.new(:competition => @competition)
  end

  def edit
    @entry = current_user.entries.find(params[:id])
  end

  def create
    @entry = current_user.entries.create(params[:entry].merge(:competition => @competition))
    respond_with @entry, :location => @competition
  end

  def update
    @entry = current_user.entries.find(params[:id])
    @entry.update_attributes(params[:entry])
    respond_with @entry, :location => @competition
  end

  private

  def load_competition
    @competition = Competition.find_by_id(params[:competition_id])
  end
end
