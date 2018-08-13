class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.string :photo
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
