class CreateServiceAccounts < ActiveRecord::Migration[7.1]
  
    def change
      create_table :service_accounts do |t|
        t.integer :id_cliente, null: false
        t.string :nombre_responsable, null: false
        t.date :fecha_asociacion, null: false
    
        t.timestamps
      end
    end
end
