class ResultsController < ApplicationController
  before_filter :load_event
  before_filter :load_competition

  respond_to :html

  def index
    @round = @event.rounds.at((params[:round] || 1).to_i - 1)
    @group = @round.groups.at((params[:group] || 1).to_i - 1)
    @results = @event.results.by_round(@round.number).by_group(@group.number)
  end

  def edit
    @result = @event.results.find(params[:id])
  end

  def update
    @result = @event.results.find(params[:id])
    @result.update_attributes(params[:result])
    respond_with @event, @result, :location => event_results_url(@event, :round => @result.round, :group => @result.group)
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_competition
    @competition = @event.competition
  end
end
