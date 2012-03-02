class ResultsController < ApplicationController
  before_filter :load_event
  before_filter :load_competition

  # GET /results
  # GET /results.json
  def index
    @results = @event.results.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @result = @event.results.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/new
  # GET /results/new.json
  def new
    @result = @event.results.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/1/edit
  def edit
    @result = @event.results.find(params[:id])
  end

  # POST /results
  # POST /results.json
  def create
    @result = @event.results.new(params[:result])

    respond_to do |format|
      if @result.save
        format.html { redirect_to [@event, @result], notice: 'Result was successfully created.' }
        format.json { render json: @result, status: :created, location: @result }
      else
        format.html { render action: "new" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /results/1
  # PUT /results/1.json
  def update
    @result = @event.results.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to [@event, @result], notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = @event.results.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to event_results_url(@events) }
      format.json { head :no_content }
    end
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_competition
    @competition = @event.competition
  end
end
