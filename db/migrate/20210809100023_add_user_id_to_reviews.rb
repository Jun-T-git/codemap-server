class AddUserIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :book, foreign_key: true
  end
end
