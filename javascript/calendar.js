// 引数の解析
const args = process.argv.slice(2);
const mIndex = args.indexOf("-m");
let monthInput = null;

if (mIndex !== -1 && args[mIndex + 1]) {
  monthInput = parseInt(args[mIndex + 1], 10);
}

// 現在の年と月を取得
const today = new Date();
const year = today.getFullYear();

// 引数を指定していればその月を選択、指定してなければ現在の月を選択
const month = monthInput !== null ? monthInput : today.getMonth() + 1;

// 引数が不正な月の場合はエラーメッセージを出す
if (month < 1 || month > 12 || isNaN(month)) {
  console.log(`${monthInput} is neither a month number (1..12) nor a name`);
  process.exit(1);
}

// 月の初日と末日を取得
const firstDay = new Date(year, month - 1, 1);
const lastDay = new Date(year, month, 0);

// カレンダーの月、年と曜日を表示（日本語・日曜日始まり）
const monthName = firstDay.toLocaleString("ja-JP", { month: "long" });
console.log(`     ${monthName} ${year}`);
console.log("日 月 火 水 木 金 土 ");

// 日曜日始まりの空白を計算
const space = firstDay.getDay();

process.stdout.write("   ".repeat(space));

// 1日から末日まで表示する
const lastDate = lastDay.getDate();
for (let d = 1; d <= lastDate; d++) {
  const currentDate = new Date(year, month - 1, d);

  // 日付を右詰め2桁にして表示
  process.stdout.write(String(d).padStart(2, " ") + " ");

  // 日曜日始まりのカレンダーなので、一週間の終わりである土曜日で改行する
  if (currentDate.getDay() === 6) {
    console.log();
  }
}

// 一番下の余白を作る
console.log("\n");
