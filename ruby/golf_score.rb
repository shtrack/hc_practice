# 2打目以降の判定を定数で定義
SCORE_NAMES = {
      -3 => "アルバトロス",
      -2 => "イーグル",
      -1 => "バーディ",
      0  => "パー",
      1  => "ボギー"
}

def judge_golf_score(par, stroke)
  # 1打で入れた場合の判定　
  if stroke == 1
    case par
    when 5
      return "コンドル"
    when 4, 3
      return "ホールインワン"
    end
  end

  # 2打目以降、golf_scoreの結果がSCORE_NAMESにある場合はその用語を、それ以外は「⚪︎ボギー」として返す
  golf_score = stroke - par
  SCORE_NAMES[golf_score] || "#{golf_score}ボギー"

end

# 標準入力から全行読み込む。改行を除いて、配列にする。
input_lines = STDIN.readlines.map(&:chomp)

# 1行目を規定打数(pars)に、2行目をプレイヤー打数(strokes)として数値の配列に変換する
pars = input_lines[0].split(',').map(&:to_i)
strokes = input_lines[1].split(',').map(&:to_i)

# zipメソッドで規定打数とプレイヤー打数を組み合わせて、判定結果を出す。
results = pars.zip(strokes).map do |par, stroke|
  judge_golf_score(par, stroke)
end

# カンマ区切りで結果を出力する。
puts results.join(',')