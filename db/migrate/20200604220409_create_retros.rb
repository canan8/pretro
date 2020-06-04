class CreateRetros < ActiveRecord::Migration[6.0]
  def change
    create_table :retros do |t|
      t.integer :team_id
      t.datetime :date
      t.decimal :rating
      t.string :status

      t.timestamps
    end
  end
end
