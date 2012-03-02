class Event < ActiveRecord::Base
  belongs_to :competition

  has_many :results

  composed_of :category, :mapping => %w(category_code code)

  def rounds
    (1..rounds_count).map do |round_number|
      Round.new(self, round_number)
    end
  end

  def create_results_for_round!(round_number, groups_count)
     competition.entries.with_category(category_code).each_with_index do |entry, idx|
       results.create! :user_id => entry.user_id,
                       :round   => round_number,
                       :group   => idx.modulo(groups_count) + 1
     end
  end
end
