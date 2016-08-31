class Carrinho < ApplicationRecord
  belongs_to :usuario
  has_many :localizacoes, as: :locationable
  has_many :pedidos

  enum estado:{
  	em_compra: 1,
  	comprado: 2
  }
end
