class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.float :calification
      t.references :player, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.timestamps
    end
  end
end
