module CompetitionsHelper
  def format_date_range(competition)
    [
      competition.start_on,
      competition.end_on
    ].uniq.join(" - ")
  end
end
