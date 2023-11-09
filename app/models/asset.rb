class Asset < ApplicationRecord
    has_many :criterions, -> { order(Arel.sql('"order" ASC')) }, as: :nestable
end
