class AddDniToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :dni, :string
    add_column :users, :localidad, :string
  end
end
