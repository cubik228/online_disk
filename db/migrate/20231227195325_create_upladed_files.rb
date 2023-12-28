class CreateUploadedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaded_files do |t|
      # your existing columns
      t.string :name
      t.timestamps
    end
  end
end
