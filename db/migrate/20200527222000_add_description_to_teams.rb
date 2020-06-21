class AddDescriptionToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :description, :string
  end
end
