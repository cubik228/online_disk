class AddDeletedToUpladedFiles < ActiveRecord::Migration[7.1]
  def change
    add_column :upladed_files, :deleted, :boolean, default: false
  end
end
