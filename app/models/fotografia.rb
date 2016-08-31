class Fotografia < ApplicationRecord
    belongs_to :imageable, polymorphic: true
end
