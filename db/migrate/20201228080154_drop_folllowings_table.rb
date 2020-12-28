class DropFolllowingsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :followings
  end
end
