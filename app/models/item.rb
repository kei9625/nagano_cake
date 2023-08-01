class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_details

  # validates :amount, numericality: { greater_than_or_equal_to: 1, message: "は1以上を選択してください" }

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence:true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def no_tax_price
    price.to_i
  end

  def tax_price
    (self.price * 1.1).floor.to_i
  end


end
