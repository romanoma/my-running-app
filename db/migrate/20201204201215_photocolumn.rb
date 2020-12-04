class Photocolumn < ActiveRecord::Migration[6.0]
  def change
    add_column :runs, :photo, :string 
  end
end
