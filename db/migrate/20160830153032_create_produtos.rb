class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.decimal :preco, default: 0
      t.references :loja, foreign_key: true
      t.integer :quantidade, default: 0

      t.timestamps
    end
  end
end
