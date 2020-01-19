# レシピ情報を取得するFactoryのインターフェース
module RecipeFactory

  # レシピを取得します
  def create_recipe
    raise NotImplementedError.new("#{self.class}##{__method__}が実装されていません")
  end
end