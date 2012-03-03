class Event < ActiveRecord::Base
  belongs_to :competition

  has_many :results

  composed_of :category, :mapping => %w(category_code code)

  def rounds
    (1..rounds_count).map do |round_number|
      Round.new(self, round_number)
    end
  end

  def create_results_for_round!(round_number, groups_count, entries_count)
    if round_number == 1
      create_results_for_first_round! groups_count
    else
      create_results_for_other_round! round_number, groups_count, entries_count
    end
  end

  private

  def create_results_for_first_round!(groups_count)
    competition.entries.with_category(category_code).each_with_index do |entry, idx|
      results.create! :user_id => entry.user_id,
                      :round   => 1,
                      :group   => idx.modulo(groups_count) + 1
    end
  end

  def create_results_for_other_round!(round_number, groups_count, entries_count)
    results.by_round(round_number - 1).winners.limit(entries_count).each_with_index do |result, idx|
      results.create! :user_id => result.user_id,
                      :round => round_number,
                      :group   => idx.modulo(groups_count) + 1
    end
  end
end
