class EventsController < ApplicationController
  before_filter :load_competition

  respond_to :html

  def new
    @event = @competition.events.new
    @event.category_code = params[:category]
  end

  def create
    @event = @competition.events.create(params[:event])
    respond_with @competition, @event, :location => event_results_path(@event)
  end

  private

  def load_competition
    @competition = current_user.competitions.find(params[:competition_id])
  end
end
