class AddImageToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :image_url, :string
  end
end
