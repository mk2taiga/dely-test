require 'optparse'
require_relative '../usecase/input/calculate_calorie_input'
require_relative '../usecase/calculate_calorie_use_case'
require_relative '../usecase/output/calculate_calorie_output'
require_relative '../domain/factory/recipe_factory_impl'
require_relative '../common/const'

# スクリプトをルーティングするモジュール
module Route
  CALCULATE_CALORIE = "calculate_calorie"
end

# スクリプトの引数取得
# 引数は実行したいスクリプト名を期待する
params = ARGV.getopts('f:')

# ファンクションと一致するユースケースを実行する
# ファンクションがない場合は、エラーを返却する
case params["f"]
when Route::CALCULATE_CALORIE then
  # 計算処理を実行する
  factory = RecipeFactoryImpl.new
  input = CalculateCalorieInput.new
  result = CalculateCalorieUseCase.new(factory).execute(input)

else
  puts "指定されたfunctionは存在しません。"
  exit CODE_ERROR
end

# ユースケースから返却された値を出力する
# TODO: 仮の値なのであとで変更する可能性あり
puts result.output