class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    puts "Ejecutando migración CreateUsers"
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :last_name
      t.string :dni
      t.string :localidad
      t.date :fecha_nacimiento

      t.timestamps
    end
  end
end

