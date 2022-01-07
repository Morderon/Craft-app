class Recipe < ApplicationRecord
    self.table_name = "md_cr_recipes"
    has_many :input
    has_many :output
    has_many :feat
    has_many :skill
    # column not named properly
    belongs_to :category,
        foreign_key: "category"
end
