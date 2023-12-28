class CombineUploadedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaded_files do |t|
      t.string :name
      t.string :attachment
      t.timestamps
    end

    # Add any other columns or indexes you need
  end
end
