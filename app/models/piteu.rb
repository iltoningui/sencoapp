class Piteu < ApplicationRecord
    belongs_to :loja
    has_many :fotografias, as: :imageable
    has_one :geral, as: :serviceable
end
