class Suica

  attr_reader :deposit

  # 預かり金(デポジット)として500円がデフォルトでチャージされているようにする
  def initialize
    @deposit = 500
  end

  # 100円以上の任意の金額をチャージできるようにし、100円未満をチャージしようとした場合は例外を発生させる
  def charge(amount)
    if amount < 100
      raise "100円未満はチャージできません"
    else
      @deposit += amount
    end
  end

  # 購入操作を行うとチャージ残高を減らすようにする
  def withdraw(amount)
    @deposit -= amount
  end
end