class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.references :character, foreign_key: true
      t.string :skill
      t.string :special
      t.integer :damage
      t.integer :range
      t.integer :critical

      t.timestamps
    end
  end
end
