$(function(){

   $(".headerLow__search-style").hover(function(){
    var category_parent = $(this).children(".headerLow__search-style__category")
        category_parent.show();
    }, 
     function(){
      $(this).children(".headerLow__search-style__category").hide();
    });

    function buildHTML(one_child){
      var html =  `
                    <div class= "headerLow__search-style__category__special">
                      <a href= "#", class= "block" > ${one_child.name}</a>
                    </div>
                  `

      $("").append(html);
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
      child.forEach(function(one_child){
        buildHTML(one_child)
      })
    })
    .fail(function(){
      window.alert("ERROR")
    })
   })
   
});