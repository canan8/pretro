class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :answer_id
      t.string :type
      t.string :detail

      t.timestamps
    end
  end
end
