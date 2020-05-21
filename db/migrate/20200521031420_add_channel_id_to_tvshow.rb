class AddChannelIdToTvshow < ActiveRecord::Migration[5.2]
  def change
    add_column :tvshows, :channel_id, :intege
  end
end
