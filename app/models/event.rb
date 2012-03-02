class Event < ActiveRecord::Base
  belongs_to :competition

  has_many :results

  after_create :create_results_for_first_round!

  private

  def create_results_for_first_round!
    competition.entries.with_category(category_code).each do |entry|
      results.create! :user_id => entry.user_id,
                      :round   => 1,
                      :group   => 1
    end
  end
end
