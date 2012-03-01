class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  scope :by_competition, lambda { |competition| where(:competition_id => competition.id) }
end
