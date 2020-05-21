class AddFavouriteToTvshow < ActiveRecord::Migration[5.2]
  def change
    add_column :tvshows, :favourite, :boolean, default: :false
  end
end
