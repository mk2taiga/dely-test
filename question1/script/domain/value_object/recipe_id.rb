require_relative 'value_object'

# レシピを識別するIDのValueObject
class RecipeID
  include ValueObject

  @recipe_id = nil

  # recipe_id: ID
  def initialize(recipe_id)
    @recipe_id = recipe_id
  end

end