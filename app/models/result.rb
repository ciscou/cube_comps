class Result < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  before_validation :calculate_best_worst_and_average

  private

  def calculate_best_worst_and_average
    times = (1..5).map { |i| send("time#{i}") }
    if times.all?
      self.best    = times.min
      self.worst   = times.max
      self.average = (times.sum - best - worst) / (times.count - 2)
    end
  end
end
