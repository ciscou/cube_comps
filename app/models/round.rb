class Round
  def initialize(event, number)
    @event, @number = event, number
    @groups_count = @event.results.by_round(@number).maximum(:group) || 1
  end

  def save!
    @event.create_results_for_round! @number, @groups_count
  end

  def groups
    (1..@groups_count).map do |group|
      Group.new(self, group)
    end
  end

  attr_accessor :groups_count

  attr_reader :number

  def name
    if @number == @event.rounds_count
      "final"
    else
      "round #{@number}"
    end
  end
end
