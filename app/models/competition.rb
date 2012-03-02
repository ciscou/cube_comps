class Competition < ActiveRecord::Base
  belongs_to :user

  default_scope order(:start_on).reverse_order

  def events
    Event.all.select { |e| has_event? e }
  end

  private

  def has_event?(event)
    send("has_event_#{event.respond_to?(:code) ? event.code : event}?")
  end
end
