class Recipe < ApplicationRecord
    self.table_name = "md_cr_recipes"
    has_many :input
    has_many :output
    has_many :feat
    has_many :skill
    #belongs_to :category column not named properly
end
