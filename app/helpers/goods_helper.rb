module GoodsHelper

  def good_image(good)
    if good.photos.any? 
      image_tag good.photos.first.file.thumb.url, alt: good.name
    else
      image_tag 'photo_not_available.jpg'
    end
  end

end
