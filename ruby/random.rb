members = ["A", "B", "C", "D", "E", "F"]

# ランダムに並び替える
shuffled = members.shuffle

# 2か3をランダムに取得する
n = [2, 3].sample

# nが2であれば、2人と4人に分けられ、nが3であれば、3人ずつに分けられる
p shuffled.take(n).sort
p shuffled.drop(n).sort