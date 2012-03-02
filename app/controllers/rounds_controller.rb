class RoundsController < ApplicationController
  before_filter :load_event
  before_filter :load_competition

  def new
    @round = @event.rounds.at(params[:id].to_i - 1)
  end

  def create
    @round = @event.rounds.at(params[:id].to_i - 1)
    @round.groups_count = params[:groups_count].to_i
    @round.save!
    redirect_to event_results_url(@event, :round => @round.number)
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_competition
    @competition = @event.competition
  end
end
