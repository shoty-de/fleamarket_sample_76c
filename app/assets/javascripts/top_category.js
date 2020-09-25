$(function(){

   $(".headerLow__search-style").hover(function(){
     // 元々display:none;がついてるクラスを取得し、display:none;を外す。
    var category_parent = $(this).children(".headerLow__search-style__category")
        category_parent.show();
    }, // 親要素のhoverの外れた時の記述↓
     function(){
      $(this).children(".headerLow__search-style__category").hide();
    });

    function buildHTML(one_child){
      var html =  `
                    <div class= "a">
                      <a href= "#", class= "block" > ${one_child.name}</a>
                    </div>
                  `
      $(".headerLow__search-style").append(html);
    }

   $(document).on("mouseenter", ".block", function(){
    
    parent_id = $(this).attr("id")
    $.ajax({
      url: "/products/childs",
      type: "GET",
      data: {id : parent_id},
      dataType: "json"
    })
    .done(function(child){
        $(".a").remove()
      child.forEach(function(one_child){
        buildHTML(one_child)
      })
    })
    .fail(function(){
      window.alert("ERROR")
    })
   })
   
});