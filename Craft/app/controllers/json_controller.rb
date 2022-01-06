class JsonController < ApplicationController
  caches_action :index, expires_in: 1.hour

  def index
    #SELECT GROUP_CONCAT(CONCAT('{', '"id": ',r.ID,',',' "Craft": ',Skill,',',' "Category": "',c.name,'",',' "Name": "',r.Name,'",',' "Value": ',Value,',',' "SubRace": ',SubRace,',',' "Class": ',Class,',',' "Level": ',Class_Level,',',' "DC": ',DC,',',' "Points": ',Points,',',' "Settings": ',Settings,',',' "Tag": "',Placeable_Tag,'",',' "Output": ',CONCAT('[', coalesce((select GROUP_CONCAT(CONCAT( '{','"Name": "',Name,'",',' "Qty": ',Qty, '}'
    @json = Recipe.select("md_cr_recipes.ID, md_cr_recipes.Skill AS Craft, c.name AS Category, md_cr_recipes.Name, md_cr_recipes.Value, md_cr_recipes.SubRace, md_cr_recipes.Class, md_cr_recipes.Class_Level AS Level, md_cr_recipes.DC, md_cr_recipes.Points, md_cr_recipes.Settings, md_cr_recipes.Placeable_Tag AS Tag").joins("INNER JOIN md_cr_category AS c ON c.id=md_cr_recipes.category").where("Settings & 1 != 1").order(:id).to_json(:include => [{:output => {:only => [:Name, :Qty]}}, {:input => {:only => [:Name, :Qty]}}, {:feat => {:only => :Feat}}, {:skill => {:only => [:Skill, :Rank]}}])
  end
end
