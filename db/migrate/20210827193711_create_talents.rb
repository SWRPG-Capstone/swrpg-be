class CreateTalents < ActiveRecord::Migration[5.2]
  def change
    create_table :talents do |t|
      t.references :character, foreign_key: true
      t.string :name
      t.integer :page_number
      t.string :ability_summary

      t.timestamps
    end
  end
end
