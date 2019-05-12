class Output < ApplicationRecord
	self.table_name = "md_cr_output"
	belongs_to :recipe
end
