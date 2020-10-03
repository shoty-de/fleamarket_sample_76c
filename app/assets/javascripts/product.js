$(document).on('turbolinks:load', function () {
  $(function () {
    var dataBox = new DataTransfer();
    var file_field = document.querySelector('input[type=file]')

    // 画像にindexを割り振るための配列を用意
    var fileIndex = [1, 2, 3, 4, 5];

    // 保存済みの画像の表示にて既に使われているindexを除外
    lastIndex = $('.item-image:last').data('index');
    fileIndex.splice(0, lastIndex);

    // 画像を挿入する処理
    $('#img-file').change(function () {
      var files = $('input[type="file"]').prop('files')[0];
      $.each(this.files, function (i, file) {
        var fileReader = new FileReader();

        dataBox.items.add(file)
        file_field.files = dataBox.files

        var num = $('.item-image').length + 1 + i
        fileReader.readAsDataURL(file);
        if (num == 5) {
          $('#image').css('display', 'none')
        }
        fileReader.onloadend = function () {
          var src = fileReader.result
          const buildFileField = (index) => {
            const html = `<div class='item-image' data-index="${index}">
                            <div class=' item-image__content'>
                              <div class='item-image__content--icon'>
                                <img src=${src} width="114" height="80" >
                              </div>
                            </div>
                            <div class='item-image__operetion'>
                              <div class='item-image__operetion--delete'>削除</div>
                            </div>
                          </div>`

            return html;
          }

          $('#image').before(buildFileField(fileIndex[0]));
        };

        $('#image').attr('class', `input-area-${num}`)
      });
    });
    // チェックボックスを非表示にするcss
    $('.hidden-destroy').hide();

    // 画像を削除する処理
    $(document).on("click", '.item-image__operetion--delete', function () {
      var target_image = $(this).parent().parent()
      var target_index = $(target_image).data('index')

      const hiddenCheck = $(`input[data-index="${target_index}"].hidden-destroy`);
      if (hiddenCheck) {
        hiddenCheck.prop('checked', true)
      };
      if (hiddenCheck.prop('checked', true)) {
      };

      if (file_field.files.length == 1) {
        $('input[type=file]').val(null)
        dataBox.clearData();
      } else {
        $.each(file_field.files, function (i, input) {
          if (input.name == target_index) {
            dataBox.items.remove(i)
          }
        })
        file_field.files = dataBox.files
      }
      target_image.remove()
      var num = $('.item-image').length
      $('#image').show()
      $('#image').attr('class', `input-area-${num}`)
    })
  });
});
