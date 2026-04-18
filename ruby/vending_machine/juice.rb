class Juice
  attr_reader :name, :price

  # ジュースは名前と値段の情報をもつようにする
  def initialize(name, price)
    @name = name
    @price = price
  end
end