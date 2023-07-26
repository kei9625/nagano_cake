class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_details

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def no_tax_price
    price.to_s(:delimited)
  end

  def tax_price
    (self.price * 1.1).floor.to_s(:delimited)
  end


end
