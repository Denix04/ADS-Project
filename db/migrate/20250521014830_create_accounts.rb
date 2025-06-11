class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.decimal :saldo, precision: 10, scale: 2
      t.string :cbu
      t.string :alias
      t.boolean :es_subcuenta
      t.reference :accounts, :principal_account, foreign_key: { to_table: :accounts }, null: true

      t.timestamps 
    end
  end
end
