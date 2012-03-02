class Group
  def initialize(round, number)
    @round, @number = round, number
  end

  attr_reader :number

  def name
    "group #{@number}"
  end
end
