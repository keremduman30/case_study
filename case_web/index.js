document.addEventListener("DOMContentLoaded", () => {
  //bu fonksiyon dom yuklediginde calısır
  const taskInput = document.getElementById("taskInput"); //input alanı için
  const addTaskBtn = document.getElementById("addTaskBtn"); //ekleme butonu
  const taskList = document.getElementById("taskList"); //listeleme yapmak için sonradan li elemenleri ekliyecez

  addTaskBtn.addEventListener("click", addTask);

  function addTask() {
    const taskText = taskInput.value.trim(); //input degerini alıyoruz
    const li = document.createElement("li"); //li elementi olusturduk sonra input degerini buna aktaracaz
    li.textContent = taskText; //liste elemanına inputtaki texti ata

    const completeBtn = document.createElement("button"); //silme butonu
    completeBtn.textContent = "Tamamlandı";
    completeBtn.className = "completed"; //stil vermek için class name
    completeBtn.addEventListener("click", () => {
      li.remove(); //ul listesinden kaldırmak için
      updateLocalStorage(); //localstoragei guncelemek için
    });

    li.appendChild(completeBtn); //liste elementinin yanına silme butonu eklemek için
    taskList.appendChild(li); //tasklistte yani ul listesine bu li elementini ekliyoruz
    taskInput.value = ""; //sonra input alanını temizliyoruz
    updateLocalStorage(); //localstoragei guncelemek için
  }
  function updateLocalStorage() {
    const tasks = [];
    const taskItem = taskList.getElementsByTagName("li"); //tum liste elemanlarını aldık
    for (let item of taskItem) {
      tasks.push(item.textContent.replace("Tamamlandı", "").trim()); //mevcut listeye ekelem yaparak listeyi guncelledik
    }
    localStorage.setItem("tasks", JSON.stringify(tasks)); //local storage kaydettik json seklinde
  }
  function loadTasks() {
    const tasks = JSON.parse(localStorage.getItem("tasks")) || []; //local storagedan liseyi aldık
    tasks.forEach(task => {
      const li = document.createElement("li"); //li elementi olusturduk
      li.textContent = task; //taski atadık

      const completeBtn = document.createElement("button"); //silme butonu
      completeBtn.textContent = "Tamamlandı";
      completeBtn.className = "completed";
      completeBtn.addEventListener("click", () => {
        li.remove();
        updateLocalStorage();
      });

      li.appendChild(completeBtn);
      taskList.appendChild(li);
    });
  }

  loadTasks(); // Sayfa yüklendiğinde görevleri yükle
});
