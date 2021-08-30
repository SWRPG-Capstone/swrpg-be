class CreateCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :species
      t.string :specialization
      t.string :career
      t.integer :age
      t.string :height
      t.string :build
      t.string :hair
      t.string :eyes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
