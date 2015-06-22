$(document).ready(function(){
  submitSearch();
}); 

var submitSearch = function(){
  $("#product-search").on('submit', function(event){
    event.preventDefault();

   var request = $.ajax({
    url:"http://localhost:3000/products/results",
    data: $(this).serialize(), 
    crossDomain: true,
    type:"GET"
   });

   request.done(function(data){
    debugger
    console.log(data);
    console.log("successssssss");
    $("#product-search").hide();
    $(".search-results")
   });
   request.fail(function(data){
    debugger
    console.log("fail");
   });
  });
};

