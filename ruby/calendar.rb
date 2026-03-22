require 'optparse'
require 'date'

# オプションの解析
opt = OptionParser.new
options = {}
opt.on('-m VAL', Integer) { |month| options[:month] = month } 
opt.parse!(ARGV)

# 現在の年と月を取得
today = Date.today
year = today.year

# 引数を指定していれば、その月を選択　指定してなければ、現在の月を選択
month = options[:month] || today.month

# 引数が不正な月の場合はエラーメッセージを出す
if month < 1 || month > 12
  puts "#{month} is neither a month number (1..12) nor a name"
  exit
end

# 月の初日と末日を取得
first_day = Date.new(year, month, 1)
last_day  = Date.new(year, month, -1)

#　カレンダーの月、年と曜日を表示
puts "     #{first_day.strftime('%B')} #{year}"
puts "Mo Tu We Th Fr Sa Su "

# wday(0:日、1:月、2:火、3:水...)を使用して、月曜始まりの空白を計算し、日曜なら6個の空白を入れて、日曜以外の時もちょうどよい空白を入れる
if first_day.wday == 0
  space = 6
else
  space = first_day.wday - 1
end

print "   " * space

# 1日から末日まで、表示する
(first_day..last_day).each do |date|
  print date.day.to_s.rjust(2) + " "
  
  # 日曜日 (wday == 0) の後に改行
  puts if date.wday == 0
end

# calのカレンダーと同じく、一番下の余白を作る
puts "\n\n"