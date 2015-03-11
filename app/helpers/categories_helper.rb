module CategoriesHelper

  def category_image(category)
    if category.picture? 
      image_tag category.picture.thumb.url, alt: category.title
    else
      image_tag 'photo-not-available.png'
    end
  end

end
