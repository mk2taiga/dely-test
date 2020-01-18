# ユースケースのモジュール
module UseCase
  # ユースケースを実行します
  def execute(input)
    raise NotImplementedError.new("#{self.class}##{__method__}が実装されていません")
  end
end