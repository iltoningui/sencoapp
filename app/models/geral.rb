class Geral < ApplicationRecord
    belongs_to :serviceable, polymorphic: true
    belongs_to :loja

    def self.adiciona_ao_carrinho(geral,carrinho)
        pedido = Pedido.create(usuario_id: carrinho.usuario_id, geral_id: geral.id, preco_unitario: geral.preco, carrinho_id: carrinho.id, quantidade: 1, preco_total: geral.preco, loja_id: geral.loja.id)
        pedido.save
    end
end
