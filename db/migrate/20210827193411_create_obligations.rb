class CreateObligations < ActiveRecord::Migration[5.2]
  def change
    create_table :obligations do |t|
      t.references :character, foreign_key: true
      t.string :type
      t.integer :magnitude

      t.timestamps
    end
  end
end
