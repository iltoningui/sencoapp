class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.integer :estado, default: 1
      t.integer :quantidade
      t.decimal :desconto
      t.decimal :preco_unitario
      t.decimal :preco_total
      t.references :usuario, foreign_key: true
      t.references :geral, foreign_key: true
      t.references :loja, foreign_key: true

      t.timestamps
    end
  end
end
