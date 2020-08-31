$(function() {

  function OptionHTML(children){
    var option =  `<option value="${children.child_id}">${children.child_name}</option>`
    return option
  };

  function AppendChildBox(insertHTML){
    var ChildSelectHtml = '';
    ChildSelectHtml = ` <div class="field-input" id="category">
                        <select class="field-input__select" name="product[category]" id="product_category"><option value="選択してください">選択してください</option>
                        ${insertHTML}
                        </select>
                        </div>`
    $("#parant").append(ChildSelectHtml)

  };


  $("#product_category").on("change", function(){
    var selected_categry = $("#product_category").val()
    if (selected_categry != "選択してください"){
    $.ajax({
      url: "get_children_category",
      type: "GET",
      data: { parent_name: selected_categry },
      dataType: 'json'
    })
    .done(function(child){
      $('#category').remove();
      insertHTML = '';
      child.forEach(function(children){
        insertHTML = insertHTML + OptionHTML(children)
      });
      AppendChildBox(insertHTML);
    })
    .fail(function(){
      alert("カテゴリを再度選択して下さい")
    })
    }else{
      $("#category").remove();
    }

  });

});