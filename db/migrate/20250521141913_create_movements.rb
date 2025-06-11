class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :reason
      t.string :service  # una descripcion del servicio que se pago
      t.datetime :date
      t.string :type  
      t.references :origin, foreign_key: { to_table: :accounts }, null: true
      t.references :destination, foreign_key: { to_table: :accounts }, null: true
      t.references :service_account, foreign_key: {to_table: :service_accounts}, null: true
      t.timestamps
    end
  end
end

