members = ["A", "B", "C", "D", "E", "F"]

#ランダムに並び替える
shuffled = members.shuffle

if rand < 0.5
  # 50%の確率で3人ずつ
  p shuffled.take(3).sort
  p shuffled.drop(3).sort
else
  # 50%の確率で2人と4人
  p shuffled.take(2).sort
  p shuffled.drop(2).sort
end