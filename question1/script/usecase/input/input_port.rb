# ユースケースへのインプットパラメータのモジュール
module InputPort
  # クラス名を返却する
  def type
    raise NotImplementedError.new("#{self.class}##{__method__}が実装されていません")
  end
end