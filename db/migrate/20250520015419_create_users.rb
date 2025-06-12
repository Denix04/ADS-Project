class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    puts "Ejecutando migración CreateUsers"
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :dni # Documento Nacional de Identidad
      t.string :localidad
      t.string :email
      t.string :password_digest
      t.date :fecha_nacimiento

      t.index :dni, unique: true
      t.index :email, unique: true
      
      t.timestamps
    end
  end
end

