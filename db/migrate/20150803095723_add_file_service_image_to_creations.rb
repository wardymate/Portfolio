class AddFileServiceImageToCreations < ActiveRecord::Migration
  def change
    add_column :creations, :image_uri, :string
    add_column :creations, :image_file_name, :string
    add_column :creations, :image_content_type, :string
    add_column :creations, :image_file_size, :integer
  end
end
