class ResultsController < ApplicationController
  before_filter :load_event
  before_filter :load_competition

  respond_to :html

  def index
    @results = @event.results.all
  end

  def show
    @result = @event.results.find(params[:id])
  end

  def edit
    @result = @event.results.find(params[:id])
  end

  def update
    @result = @event.results.find(params[:id])
    @result.update_attributes(params[:result])
    respond_with @event, @result
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_competition
    @competition = @event.competition
  end
end
