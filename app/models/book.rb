class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  validates_presence_of :title


  def self.search(params)
    where("title LIKE?", "%#{params}%")
  end


end
