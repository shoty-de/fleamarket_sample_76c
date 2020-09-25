$(function () {
  var boxes = $(".mypage-nav__list--item");
  function getActive() {
    $(this).addClass("active-mypage");
  };
  function removeActive() {
    $(".active-mypage").removeClass("active-mypage");
  };
  boxes.mouseenter(getActive);
  boxes.mouseleave(removeActive);
});
