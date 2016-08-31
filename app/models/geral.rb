class Geral < ApplicationRecord
    belongs_to :serviceable, polymorphic: true
    belongs_to :loja

    def self.adiciona_ao_carrinho(geral,carrinho)
        pedido = Pedido.create(geral_id: geral.id, preco_unitario: geral.preco, carrinho_id: carrinho.id, quantidade: 1, preco_total: geral.preco)
        pedido.save
    end
end
