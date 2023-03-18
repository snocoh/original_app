window.addEventListener('load', function(){
  const delete_btn = document.getElementById("delete-btn");

  delete_btn.addEventListener(`click`, function(){
    alert("商品情報を削除しますか？")
  })
})