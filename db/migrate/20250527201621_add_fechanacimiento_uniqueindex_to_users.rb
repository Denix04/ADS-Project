class AddFechanacimientoUniqueindexToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :fecha_nacimiento, :date
    add_index :users, :dni, unique: true
  end
end