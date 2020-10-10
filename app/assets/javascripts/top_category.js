$(document).on('turbolinks:load', function () {
  $(function () {

    /* カテゴリの文字に乗った際に起こるイベント */

    $(".parentcategory").hover(function () {
      var category_parent = $(this).find(".parents_class")
      //  元々display:noneでHTMLを非表示にしている為show()で表示↓
      category_parent.show();
    },  //  親要素のhoverの外れた時の記述↓
      function () {
        //  表示されたされたhtmlを再度隠す↓
        $(this).find(".parents_class").hide()
      });

    /* 親カテゴリに乗った際に起こるイベント関連 */

    // 小カテゴリを作成する関数
    function ChildrenHTML(one_child) {
      var children_category = `<div class= "Block">
                                    <a href= "#", class= "blocks" > ${one_child.name}</a>
                                </div>
                                `
      // この関数はChildrenHTML関数の呼び出し元に戻るので、何を返すかしっかりと明示する必要性がある
      return children_category
    }

    // 親カテゴリに一回に対して一回のみ発火(子カテゴリは元々OptionHTMLにて作成してあるのを一緒に持ってくる)
    function MakeChildrenBox(insertHTML) {
      html = `
                <div class="whitebox">
                  ${insertHTML}
                </div>
                `
      $(".children_class").append(html);

      // この関数ではappendすることが目的なので,ここで処理が終了する。(return文が必要ない理由)
    }

    //  親カテゴリに乗った時の実際のイベント発火
    $(document).on("mouseenter", ".headerLow__search-style__category", function () {
      parent_id = $(this).children().attr("id")
      $.ajax({
        url: "/products/childs",
        type: "GET",
        data: { id: parent_id },
        dataType: "json"
      })
        .done(function (child) {
          $(".whitebox").remove();
          insertHTML = ""
          child.forEach(function (one_child) {
            insertHTML = insertHTML + ChildrenHTML(one_child)
          })
          MakeChildrenBox(insertHTML);
        })
        .fail(function () {
          window.alert("ERROR");
        })
    });

    //  親カテゴリと小カテゴリをまとめるdiv要素からマウスが離れた時のイベント発火であり、MakeChildrenBox関数でappendした小カテゴリを消す。↓
    $(document).on("mouseleave", ".parents_children_box", function () {
      $(".whitebox").remove();
    })

  });
});
