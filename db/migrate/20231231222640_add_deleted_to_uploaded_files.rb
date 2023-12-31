class AddDeletedToUploadedFiles < ActiveRecord::Migration[7.1]
  def change
    add_column :uploaded_files, :deleted, :boolean, default: false
  end
end
