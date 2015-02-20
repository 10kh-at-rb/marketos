module CategoriesHelper

  def category_image(category)
    if category.picture? 
      image_tag category.picture.thumb.url, alt: category.title
    else
      image_tag 'photo_not_available.jpg'
    end
  end

end
