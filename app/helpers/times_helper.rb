module TimesHelper
  def format_time(time)
    number_with_precision time, :precision => 2
  end
end
