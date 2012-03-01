module ApplicationHelper
  def flash_messages
    flash.map do |k, v|
      content_tag :div, v, :class => div_class_for_flash_type(k)
    end.join.html_safe
  end

  private

  def div_class_for_flash_type(flash_type)
    case flash_type
    when :notice then "alert alert-success"
    when :alert  then "alert alert-error"
    else flash_type
    end
  end
end
