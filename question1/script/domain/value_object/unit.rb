require_relative 'value_object'

# 使用単位のValueObject
module Unit
  include ValueObject
  
  GRAM = "g"
  PACK = "パック"
  SHOUSHOU = "少々"
  OOSAJI = "大さじ"
  KOSAJI = "小さじ"

end