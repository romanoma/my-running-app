class Newcolumn < ActiveRecord::Migration[6.0]
  def change
    add_column :runners, :username, :string 
  end
end
