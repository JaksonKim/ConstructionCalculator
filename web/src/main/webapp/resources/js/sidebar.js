$(document).ready(function () {
console.log("sidebar inited")
$('tr').click(function(){
   $('.sidebar').empty();
    $(this).find('.controller').each(function(){

      $(this).clone().appendTo('.sidebar');
   })
})
});
