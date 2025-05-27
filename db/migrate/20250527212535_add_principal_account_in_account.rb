class AddPrincipalAccountInAccount < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :principal_account, foreign_key: { to_table: :accounts }, null: true
  end
end
