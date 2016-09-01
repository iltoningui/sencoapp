class AddCarrinhoToPedido < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :carrinho, foreign_key: true
  end
end
