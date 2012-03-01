class EntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_competition

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = current_user.entries.new(:competition => @competition)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = current_user.entries.new(params[:entry].merge(:competition => @competition))

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @competition, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_competition
    @competition = Competition.find_by_id(params[:competition_id])
  end
end
