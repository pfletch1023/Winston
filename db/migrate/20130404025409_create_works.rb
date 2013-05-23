class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.text :description
      t.string :role
      t.datetime :datetime
      t.integer :type_id
      t.attachment :image
      t.string :program
      t.string :director
      t.string :domain
    end
  end
end
