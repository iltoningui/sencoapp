class Usuario < ApplicationRecord
  belongs_to :loja, optional: true
  has_one :localizacao, as: :locationable
  has_one :fotografia, as: :imageable
  has_many :pedidos
  has_many :lojas, through: :pedidos

  enum roles_mask:{
  	super_admin: 1,
  	admin: 2,
  	gestor: 4,
  	entregador: 8,
    atendedor: 9,
  	cliente: 12,
  }

  enum genero:[
    :masculino,
    :femenino,
    :outro,
  ]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
