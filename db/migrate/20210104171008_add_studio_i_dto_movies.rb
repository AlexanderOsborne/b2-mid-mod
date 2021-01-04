class AddStudioIDtoMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :studio_id, :integer
    add_index :movies, :studio_id
  end
end
