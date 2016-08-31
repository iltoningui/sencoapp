class Pedido < ApplicationRecord
  belongs_to :usuario
  belongs_to :geral
  belongs_to :loja
  belongs_to :carrinho_de_compra
  has_many :localizacoes, as: :locationable
end
