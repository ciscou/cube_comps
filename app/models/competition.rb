class Competition < ActiveRecord::Base
  belongs_to :user

  has_many :entries
  has_many :events

  default_scope order(:start_on).reverse_order

  def categories
    Category.all.select { |c| has_category? c }
  end

  private

  def has_category?(category)
    send("has_category_#{category.respond_to?(:code) ? category.code : category}?")
  end
end
