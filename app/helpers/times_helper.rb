module TimesHelper
  def format_time(time)
    return "-" if time.nil?

    minutes, seconds = time.divmod(60)
    minutes = minutes > 0.0 ? minutes.to_i : nil
    seconds = number_with_precision(seconds, :precision => 2).rjust(5, "0")
    [minutes, seconds].compact.join(":")
  end
end
