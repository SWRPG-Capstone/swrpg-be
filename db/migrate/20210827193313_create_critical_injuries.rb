class CreateCriticalInjuries < ActiveRecord::Migration[5.2]
  def change
    create_table :critical_injuries do |t|
      t.references :character, foreign_key: true
      t.integer :severity
      t.string :result

      t.timestamps
    end
  end
end
