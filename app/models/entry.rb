class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  scope :by_competition, lambda { |competition| where(:competition_id => competition.id) }
  scope :with_category, lambda { |category_code| where("has_category_#{category_code}" => true) }
end
