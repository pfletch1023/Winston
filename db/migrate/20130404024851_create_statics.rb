class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.string :paralink
      t.text :content
    end
  end
end
