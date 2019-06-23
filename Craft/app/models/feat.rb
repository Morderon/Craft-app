class Feat < ApplicationRecord
    self.table_name = "md_cr_feats"
    belongs_to :recipe
end
