class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :reason
      t.string :service  #  t.references :service cuando tengamos la  tabla services
      t.datetime :date
      t.string :type  
      t.references :origin, foreign_key: { to_table: :accounts }, null: true
      t.references :destination, foreign_key: { to_table: :accounts }, null: true

      t.timestamps
    end
  end
end

