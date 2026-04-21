require_relative 'suica'
require_relative 'vending_machine'

suica = Suica.new
vm = VendingMachine.new

puts "--- ペプシ購入前 ---"
puts "購入可能リスト: #{vm.purchasable_list(suica)}"
puts "ペプシ在庫: #{vm.stock("ペプシ")}個"

# ペプシを購入する
vm.buy(suica, "ペプシ")

puts "--- ペプシ購入後 ---"
puts "ペプシ在庫: #{vm.stock("ペプシ")}個"
puts "suica残高: #{suica.deposit}円"
puts "売上: #{vm.sales}円"

# ペプシを1本補充する
vm.restock("ペプシ", 1, 150)

puts "--- ペプシの在庫を補充後 ---"
puts "ペプシ在庫: #{vm.stock("ペプシ")}個"

# suicaに100円チャージする
suica.charge(100)

puts "--- suicaに100円チャージ後 ---"
puts "suica残高: #{suica.deposit}円"