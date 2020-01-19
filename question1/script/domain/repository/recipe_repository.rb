# レシピ情報を取得するRepositoryのインターフェース
module RecipeRepository

  # レシピを取得します
  def get_recipe
    raise NotImplementedError.new("#{self.class}##{__method__}が実装されていません")
  end
end