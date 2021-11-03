class Category < ApplicationRecord
    has_many :books
    validates :name, presence: true, uniqueness: true
    before_destroy :check_book, prepend: true

    def check_book
        if Category.books.present?
            self.errors.add(:category, "Can't be destroy because this category contains some books")
            return false
        end 
    end
end
