class CreateMotivations < ActiveRecord::Migration[5.2]
  def change
    create_table :motivations do |t|
      t.references :character, foreign_key: true
      t.string :mo_type

      t.timestamps
    end
  end
end
