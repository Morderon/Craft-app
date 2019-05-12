class Input < ApplicationRecord
	self.table_name = "md_cr_input"
	belongs_to :recipe
end
