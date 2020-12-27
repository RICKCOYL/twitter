class DropUserTable < ActiveRecord::Migration[6.1]
  def change
    execute "DROP TABLE #{:users} CASCADE"
  end
end
