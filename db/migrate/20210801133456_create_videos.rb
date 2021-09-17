class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :videokey
      t.string :video_language
      t.string :video_title
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
