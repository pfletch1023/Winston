class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.text :description
      t.string :role
      t.datetime :datetime
      t.integer :type_id
      t.has_attached_file :image
    end
  end
end
