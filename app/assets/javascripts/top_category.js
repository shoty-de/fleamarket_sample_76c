$(function(){

/* カテゴリの文字に乗った際に起こるイベント */

   $(".parentcategory").hover(function(){
    var category_parent = $(this).find(".testclass")
        //  元々display:noneでHTMLを非表示にしている為show()で表示↓
        category_parent.show();
    },  //  親要素のhoverの外れた時の記述↓
     function(){
        //  表示されたされたhtmlを再度隠す↓
      $(this).find(".testclass").hide()
    });
    
/* 親カテゴリに乗った際に起こるイベント関連 */

    // 小カテゴリを作成する関数
    function OptionHTML(one_child){
      var children_category = `<div class= "a">
                                  <a href= "#", class= "blocks" > ${one_child.name}</a>
                               </div>
                              `
    // 返り値をしっかり定義させる 理由は？
      return children_category
    }

    // 親カテゴリに一回に対して一回のみ発火(子カテゴリは元々OptionHTMLにて作成してあるのを一緒に持ってくる)
    function AppendChildBox(insertHTML){ 
      var html = ""; // これ何？
      html =  `
              <div class="whitebox">
                ${insertHTML}
              </div>
              `
      $(".testclass2").append(html);
    }

   //  親カテゴリに乗った時の実際のイベント発火
   $(document).on("mouseenter", ".headerLow__search-style__category", function(){
    parent_id = $(this).children().attr("id")
    $.ajax({
      url: "/products/childs",
      type: "GET",
      data: {id : parent_id},
      dataType: "json"
    })
    .done(function(child){
      $(".whitebox").remove();
      insertHTML = ""  // これ何？
      child.forEach(function(one_child){
      insertHTML = insertHTML + OptionHTML(one_child)
      })
      AppendChildBox(insertHTML);
    })
    .fail(function(){
      window.alert("ERROR");
    })
   });

  //  親カテゴリと小カテゴリをまとめるdiv要素からマウスが離れた時のイベント発火であり、AppendChildBox関数でappendした小カテゴリを消す。↓
   $(document).on("mouseleave", ".test", function(){
    $(".whitebox").remove();
  })
   
});