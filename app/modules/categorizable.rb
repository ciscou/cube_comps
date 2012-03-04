module Categorizable
  def categories
    Category.all.select { |c| has_category? c }
  end

  def has_category?(category)
    send("has_category_#{category.respond_to?(:code) ? category.code : category}?")
  end
end
