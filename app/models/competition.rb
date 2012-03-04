class Competition < ActiveRecord::Base
  include Categorizable

  belongs_to :user

  has_many :entries
  has_many :events

  default_scope order(:start_on).reverse_order

  def categories
    Category.all.select { |c| has_category? c }
  end
end
