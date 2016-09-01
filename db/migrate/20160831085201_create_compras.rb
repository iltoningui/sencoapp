class CreateCompras < ActiveRecord::Migration[5.0]
  def change
    create_table :compras do |t|
      t.string :cartao_numero
      t.string :pin_cartao
      t.references :carrinho, foreign_key: true

      t.timestamps
    end
  end
end
