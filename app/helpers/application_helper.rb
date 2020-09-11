module ApplicationHelper
  def search_parent_category(category)
    categories = Category.where(ancestry: category.id).all

    category_ids = []
    categories.each do |category|
      category_ids << category.id
    end

    products = []
    category_ids.each do |category_id|
      products << Product.where(category_id: category_id)
    end

    @products = products.flatten!.shuffle
  end
end
