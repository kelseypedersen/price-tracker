$(document).ready(function(){
  hardLanding();
  submitSearch()
}); 



var hardLanding = function(){
  $('a').on('click', function(event){
    event.preventDefault();

  $('a').remove();
  $(".search-product-form").css("display", "block");

  var request = $.ajax({
    url:"http://localhost:3000/products/newest_products",
    crossDomain: true,
    type:"GET"
   });

    request.done(function(data){
      var products = data["products"]

      for(i = 0; i < products.length; i++){ 
        $(".softLanding").append("<div class='product'><a href='" + products[i].clickUrl + "'>" + "<img src='" + products[i].image.sizes.IPhoneSmall.url + "' alt='product Image'>" + "</a></div>")
      };
    });
  });
};


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
    console.log("successssssss");
    $(".softLanding").remove();
    var products = data["products"]


    for(i = 0; i < products.length; i++){
      $(".search-results").prepend("<div class='product'><a href='" + products[i].clickUrl + "'>" + "<img src='" + products[i].image.sizes.IPhoneSmall.url + "' alt='product Image'>" + "</a></div>")
    };

   });

   request.fail(function(data){
    console.log("fail");
   });
  });
};

