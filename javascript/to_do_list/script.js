// DOM要素の取得
const input = document.getElementById("todo-input");
const addBtn = document.getElementById("add-btn");
const todoList = document.getElementById("todo-list");

const totalCountEl = document.getElementById("total-count");
const completedCountEl = document.getElementById("completed-count");
const incompleteCountEl = document.getElementById("incomplete-count");

// タスクの数を更新する関数
function updateTaskCount() {
  const totalTasks = todoList.querySelectorAll("li").length;
  const completedTasks = todoList.querySelectorAll("li.completed").length;
  const incompleteTasks = totalTasks - completedTasks;

  totalCountEl.textContent = totalTasks;
  completedCountEl.textContent = completedTasks;
  incompleteCountEl.textContent = incompleteTasks;
}

// タスクを追加（保存）する関数
function addTask() {
  const taskText = input.value;

  // リスト項目（li）の作成
  const li = document.createElement("li");

  // ①チェックボックスの作成
  const checkbox = document.createElement("input");
  checkbox.type = "checkbox";
  checkbox.addEventListener("change", () => {
    if (checkbox.checked) {
      li.classList.add("completed");
    } else {
      li.classList.remove("completed");
    }
    updateTaskCount();
  });

  // ②タスクテキスト（span）の作成
  const textSpan = document.createElement("span");
  textSpan.className = "todo-text";
  textSpan.textContent = taskText;

  // ③操作ボタン用グループの作成
  const btnGroup = document.createElement("div");
  btnGroup.className = "btn-group";

  // ④編集ボタンの作成
  const editBtn = document.createElement("button");
  editBtn.textContent = "編集";
  editBtn.className = "edit-btn";

  let isEditing = false;
  editBtn.addEventListener("click", () => {
    if (!isEditing) {
      // 編集モード：文字から入力フォームに切り替え
      const editInput = document.createElement("input");
      editInput.type = "text";
      editInput.value = textSpan.textContent;
      editInput.className = "edit-input";

      li.replaceChild(editInput, textSpan);
      editBtn.textContent = "保存";
      isEditing = true;
    } else {
      // 保存モード：入力フォームから文字に復帰
      const editInput = li.querySelector(".edit-input");
      textSpan.textContent = editInput.value;

      li.replaceChild(textSpan, editInput);
      editBtn.textContent = "編集";
      isEditing = false;
    }
  });

  // ⑤削除ボタンの作成
  const deleteBtn = document.createElement("button");
  deleteBtn.textContent = "削除";
  deleteBtn.className = "delete-btn";

  deleteBtn.addEventListener("click", () => {
    // 確認ダイアログの表示
    if (confirm("本当に削除してもよろしいですか？")) {
      todoList.removeChild(li);
      updateTaskCount();
    }
  });

  // 要素の組み立て
  btnGroup.appendChild(editBtn);
  btnGroup.appendChild(deleteBtn);

  li.appendChild(checkbox);
  li.appendChild(textSpan);
  li.appendChild(btnGroup);

  todoList.appendChild(li);

  // 入力欄をクリア
  input.value = "";

  // タスク数を更新
  updateTaskCount();
}

// 保存ボタンをクリックした時の処理
addBtn.addEventListener("click", addTask);
