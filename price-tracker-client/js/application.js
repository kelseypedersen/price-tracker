$(document).ready(function(){
  submitSearch();
}); 

var submitSearch = function(){
  $("#product-search").on('submit', function(event){
    event.preventDefault();

   var request = $.ajax({
    url:"http://localhost:3000/products/results", 
    crossDomain: true,
    type:"GET"
   });

   request.done(function(data){
    console.log("successssssss");
    $("#product-search").hide();
   });
   request.fail(function(data){
    console.log("fail");
   });
  });
};

