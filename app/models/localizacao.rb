class Localizacao < ApplicationRecord
    belongs_to :locationable, polymorphic: true

end
