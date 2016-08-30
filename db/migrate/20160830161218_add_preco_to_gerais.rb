class AddPrecoToGerais < ActiveRecord::Migration[5.0]
  def change
    add_column :gerais, :preco, :decimal
  end
end
