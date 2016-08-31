class Geral < ApplicationRecord
    belongs_to :serviceable, polymorphic: true
end
