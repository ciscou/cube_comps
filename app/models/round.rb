class Round
  def initialize(event, number)
    @event, @number = event, number
    @groups_count = @event.results.by_round(@number).maximum(:group)
  end

  def save!
    @event.create_results_for_round! @number, @groups_count
  end

  attr_accessor :groups_count

  attr_reader :number

  def name
    if @number == @event.rounds_count
      "Final"
    else
      "Round #{@number}"
    end
  end
end
