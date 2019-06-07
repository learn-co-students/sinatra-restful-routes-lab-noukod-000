class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |el|
      el.string :name
      el.text :ingredients
      el.string :cook_time
    end
  end
end
