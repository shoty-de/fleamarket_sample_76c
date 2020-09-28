$(function(){

   $(".parentcategory").hover(function(){
    var category_parent = $(this).find(".testclass")
        //  元々display:noneでHTMLを非表示にしている為show()で表示↓
        category_parent.show();
    },  //  親要素のhoverの外れた時の記述↓
     function(){
        //  表示されたされたhtmlを再度隠す↓
      $(this).find(".testclass").hide()
    });

    function buildHTML(one_child){
      var html =  `
                    <div class= "a">
                      <a href= "#", class= "blocks" > ${one_child.name}</a>
                    </div>
                  `
      $(".testclass2").append(html);
    }

   //  親カテゴリにマウスが乗った時のイベント発火↓
   $(document).on("mouseenter", ".headerLow__search-style__category", function(){
    parent_id = $(this).children().attr("id")
    $.ajax({
      url: "/products/childs",
      type: "GET",
      data: {id : parent_id},
      dataType: "json"
    })
    .done(function(child){
      child.forEach(function(one_child){
      buildHTML(one_child)
      })
    })
    .fail(function(){
      window.alert("ERROR");
    })
   });

  //  親カテゴリからマウスが離れた時のイベント発火↓
   $(document).on("mouseleave", ".headerLow__search-style__category", function(){
     $(".a").remove();
   })
   
});