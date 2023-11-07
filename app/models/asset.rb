class Asset < ApplicationRecord
    has_many :criterions, as: :nestable
end
