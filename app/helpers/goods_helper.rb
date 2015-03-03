module GoodsHelper

  def good_image(good)
    if good.photos.any? 
      image_tag good.photos.first.file.thumb.url, alt: good.name
    else
      image_tag 'photo_not_available.jpg'
    end
  end

  def good_image_small(good)
    if good.photos.first
      image_tag good.photos.first.file.small_thumb.url alt: good.name
    else
      "w/o photo"
    end
  end

end
