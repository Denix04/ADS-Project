class AddServiceAccount < ActiveRecord::Migration[7.1]
  def change
    add_reference :movements, :service_account, foreign_key: true, null: true
  end
end
