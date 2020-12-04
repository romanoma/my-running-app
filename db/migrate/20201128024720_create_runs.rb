class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.string :city
      t.string :start
      t.string :end
      t.string :distance
      t.string :track_type
      t.string :hills
      t.string :details
      t.integer :runner

      t.timestamps
    end
  end
end
