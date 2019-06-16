class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes |t| do 
      t.string :name 
      t.string :ingredients 
      t.timestamps :cook_time
    end
  end
end
