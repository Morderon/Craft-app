class Recipe < ApplicationRecord
	self.table_name = "md_cr_recipes"
	has_many :input
        has_many :output
end
