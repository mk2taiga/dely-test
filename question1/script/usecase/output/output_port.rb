# ユースケースからの出力パラメータのモジュール
module OutputPort
  # 出力結果を取得します
  def output
    raise NotImplementedError.new("#{self.class}##{__method__}が実装されていません")
  end
end