class CreateCreations < ActiveRecord::Migration
  def change
    create_table :creations do |t|
      t.string :name

      t.timestamps
    end
  end
end
