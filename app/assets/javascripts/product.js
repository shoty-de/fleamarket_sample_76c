$(document).on('turbolinks:load', function () {
  $(function () {
    // file_fieldを表示する関数
    var buildInput = (index) => {
      var html = `<input type="file"
                      name="product[product_images_attributes][${index}][image]" style="display:none"
                      id="product_product_images_attributes_${index}_image" class="hidden-field">`;
      return html;
    }

    // プレビュー画像を表示する関数
    var buildImage = (index, url) => {
      var html = `<div class='item-image' data-index="${index}" id='item-image_${index}'>
                                <div class=' item-image__content'>
                                  <div class='item-image__content--icon'>
                                    <img src="${url}" width="114" height="80" >
                                  </div>
                                </div>
                                <div class='item-image__operetion'>
                                  <div class='item-image__operetion--delete' id='delete_btn_${index}'>削除</div>
                                </div>
                              </div>`
      return html;
    };

    // 画像にindexを割り振るための配列を用意
    var fileIndex = [0, 1, 2, 3, 4];

    // 保存済みの画像の表示にて既に使われているindexを配列から除外する
    lastIndex = $('.item-image:last').data('index');
    fileIndex.splice(0, lastIndex + 1);

    // file_fieldとチェックボックスを非表示にするcss
    $('.hidden-field').hide();
    $('.hidden-destroy').hide();

    // 画像を挿入する処理
    $('#image').on('change', '.hidden-field', function (e) {
      // ファイルのブラウザ上でのURLを取得する
      var file = e.target.files[0];
      var blobUrl = window.URL.createObjectURL(file);

      // 画像のプレビューを表示する
      $('#image').before(buildImage(fileIndex[0], blobUrl));
      // fileIndexの先頭の数字を使って新しくinputを作る
      $('#image').append(buildInput(fileIndex[1]));

      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)

      // 入力ボタンが対象としているフォームのidを切り替える
      $('#image').attr('for', `product_product_images_attributes_${fileIndex[0]}_image`)

      // 画像が5枚になったら入力ボタンを非表示にする
      if ($('.item-image').length == 5) {
        $('#image').hide();
      }
    });

    // 画像を削除する処理
    $(document).on("click", '.item-image__operetion--delete', function () {
      // 選択した画像を取得する
      var target_image = $(this).parent().parent()
      // 選択した画像のindexを取得する
      var target_index = $(target_image).data('index')

      // 選択した画像が登録済みの場合、対応するチェックボックスにチェックする
      var hiddenCheck = $(`input[data-index="${target_index}"].hidden-destroy`);
      if (hiddenCheck) {
        hiddenCheck.prop('checked', true)
      };

      // 選択した画像の表示を消去する
      target_image.remove()
      // 選択した画像と対応するfile_fieldを消去する
      $(`#product_product_images_attributes_${target_index}_image`).remove()

      // 画像が4枚になったら入力ボタンを再表示する
      if ($('.item-image').length <= 4) {
        $('#image').show();
      }

      // 入力欄がゼロ個にならない様にする（画像表示が全て消されたら入力欄を復活させる）
      if ($('.item-image').length == 0) {
        $('#image').append(buildInput(fileIndex[0]));
      }
    });
  });
});
