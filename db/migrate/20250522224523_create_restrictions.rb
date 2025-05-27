class CreateRestrictions < ActiveRecord::Migration[7.1]
  def change
    create_table :restrictions do |t|
      t.references :cuenta_primaria, null: false, foreign_key: { to_table: :accounts } #la cuenta que pone la restriccion
      t.references :subcuenta, null: false, foreign_key: { to_table: :accounts } #cuenta restringida
      t.string :type , null: false                  # STI :"RestrictionMonto" o "RestrictionHorario"
      t.decimal :monto                  # solo para RestrictionMonto
      t.text :dias , null: false           #va a a ser un arreglo de dias
      t.time :horario_inicio            # solo para RestrictionHorario
      t.time :horario_fin               # solo para RestrictionHorario
      t.boolean :baja, default: false  #para dar de baja logicamente
      t.timestamps
  end
end
end
  