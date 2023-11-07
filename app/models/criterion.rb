class Criterion < ApplicationRecord
    belongs_to :nestable, polymorphic: true

    has_many :criterions, as: :nestable
end
