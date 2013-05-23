class Videos < ActiveRecord::Migration
  def change
    change_table :works do |t|
      t.string :video_url
    end
  end
end
