class AddColumnsToFeatures < ActiveRecord::Migration[7.1]
  def change
    add_column :features, :place, :string
    add_column :features, :time, :datetime
    add_column :features, :url, :string
    add_column :features, :tsunami, :boolean
    add_column :features, :mag_type, :string
    add_column :features, :title, :string
    add_column :features, :longitude, :decimal
    add_column :features, :latitude, :decimal
  end
end
