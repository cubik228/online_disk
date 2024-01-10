class RemoveNameFromUploadedFiles < ActiveRecord::Migration[7.1]
  def change
    remove_column :uploaded_files, :name, :string
  end
end
