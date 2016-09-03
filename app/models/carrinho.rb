class Carrinho < ApplicationRecord
  belongs_to :usuario
  has_many :localizacoes, as: :locationable
  has_many :pedidos

  enum estado:{
  	em_compra: 1,
  	comprado: 2
  }

	def muda_estado(carrinho)
	    if (carrinho.estado == "em_compra")
	      carrinho.estado = "comprado"
	    else
	      "estas compras ja foram feitas"
	    end
	    carrinho.save
	end
end
