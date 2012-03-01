class Competition < ActiveRecord::Base
  belongs_to :user

  default_scope order(:start_on).reverse_order
end
