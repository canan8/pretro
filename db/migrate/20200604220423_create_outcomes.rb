class CreateOutcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :outcomes do |t|
      t.integer :retro_id
      t.string :detail
      t.string :status
      t.string :priority
      
      t.timestamps
    end
  end
end
