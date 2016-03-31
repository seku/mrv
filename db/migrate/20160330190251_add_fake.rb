class AddFake < ActiveRecord::Migration
  def change
    add_column :handles, :fake, :string
  end
end
