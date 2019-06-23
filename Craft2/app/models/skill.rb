class Skill < ApplicationRecord
    self.table_name = "md_cr_skills"
    belongs_to :recipe
end
