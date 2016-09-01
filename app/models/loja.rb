class Loja < ApplicationRecord
    has_many :lojas, foreign_key: "representante_id"
    belongs_to :representante, class_name: "Loja"
    has_one :localizacao, as: :locationable
    has_one :fotografia, as: :imageable
    has_many :pedidos
    has_many :usuarios, through: :pedidos
    has_many :usuarios
    has_many :gerais
end
