class CompetitionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  respond_to :html

  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def new
    @competition = current_user.competitions.new
  end

  def edit
    @competition = current_user.competitions.find(params[:id])
  end

  def create
    @competition = current_user.competitions.new(params[:competition])
    @competition.save
    respond_with @competition
  end

  def update
    @competition = current_user.competitions.find(params[:id])
    @competition.update_attributes(params[:competition])
    respond_with @competition
  end

  def destroy
    @competition = current_user.competitions.find(params[:id])
    @competition.destroy
    respond_with @competition
  end
end
