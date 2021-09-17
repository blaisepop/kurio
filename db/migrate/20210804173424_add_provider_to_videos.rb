class AddProviderToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :video_provider, :string
  end
end
