class AddTitleToRetros < ActiveRecord::Migration[6.0]
  def change
    add_column :retros, :title, :string
  end
end
