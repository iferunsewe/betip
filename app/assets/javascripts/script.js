$(document).ready(function(){
  $("select").change(function(){
    $( "select option:selected").each(function(){
      if($(this).attr("value")=="Customer"){
        $(".set_price").hide();           
      }
      if($(this).attr("value")=="Tipster"){
        $("set_price").show();
      }  
    });
  }).change();
});