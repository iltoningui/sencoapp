class Pedido < ApplicationRecord
  belongs_to :usuario
  belongs_to :geral
  belongs_to :loja
end
