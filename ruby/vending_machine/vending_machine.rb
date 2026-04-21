require_relative 'juice'

class VendingMachine

  attr_reader :sales, :inventory

  # 初期状態でペプシ、モンスター、いろはすをそれぞれ5本ずつ格納する
  def initialize
    @inventory = {
      "ペプシ"     => { juice: Juice.new("ペプシ", 150), count: 5 },
      "モンスター" => { juice: Juice.new("モンスター", 230), count: 5 },
      "いろはす"   => { juice: Juice.new("いろはす", 120), count: 5 }
    }

    @sales = 0

  end

  # 在庫(本数)を取得できるようにする
  def stock(name)
    @inventory[name][:count]
  end

  # 購入可能かチェックする(購入できるかどうかを取得)
  def purchasable?(suica, name)
    stock(name) > 0 && suica.deposit >= @inventory[name][:juice].price
  end

  # 購入可能なドリンクのリストを取得できるようにする
  def purchasable_list(suica)
    @inventory.keys.select { |name| purchasable?(suica, name) }
  end

  # 自動販売機に在庫を補充できるようにする
  def restock(name, amount, price)
    @inventory[name][:count] += amount
  end

  # 購入処理
  def buy(suica, name)
    # ジュース値段以上のチャージ残高がある場合(※購入可能な状態)
    if  purchasable?(suica, name)

      target_juice = @inventory[name][:juice]

      # チャージ残高を減らす
      suica.withdraw(target_juice.price)

      # 売り上げ金額を増やす
      @sales += target_juice.price

      # ジュースの在庫を減らす
      @inventory[name][:count] -= 1

    # チャージ残高が足りない場合もしくは在庫がない場合(※購入不可な状態)は例外を発生させる
    else
      raise "チャージ残高が足りないかもしくは在庫がありません。"
    end
  end
end