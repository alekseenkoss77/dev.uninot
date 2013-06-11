//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require ckeditor/init
//= require autocomplete-rails

$(function(){
  $(".select-role").click(function(){
    if($(".select-role input:checked").val() == 'warden') {
      $("#wardengroup").removeClass("invise");
    }
    if($(".select-role input:checked").val() == 'teacher') {
      $("#wardengroup").addClass("invise");
      $(".warden-group :selected").removeAttr("selected");
    }
  });
});

$(function(){
  $("#group").click(function(){
    $(this).val('').removeClass("italian");
  });
});

$(function(){
  $("#order_role").change(function(){
    var select = $("#order_role option:selected").val();
    if (select == "Студент" || select == "Староста") {
      $("#order_group_p").removeClass("order_group");
    } else {
      $("#order_group_p").addClass("order_group");
      $("#order_group").val(""); 
    }
  });
});