class CreateHandles < ActiveRecord::Migration
  def change
    create_table :handles do |t|
      t.string :code
      t.string :make
      t.string :kind
      t.string :years
      t.timestamps
    end
  end
end
