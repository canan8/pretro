class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :retro_id
      t.integer :rating
      
      t.timestamps
    end
  end
end
