class ChangeEntryTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :entries, :type, :entry_type
  end
end
