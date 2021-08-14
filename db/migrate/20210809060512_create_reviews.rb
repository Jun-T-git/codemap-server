class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :recommendation_level
      t.integer :difficulty_level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
