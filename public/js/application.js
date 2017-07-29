$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.voteup').on('click',function(event){
    event.preventDefault();
    var $link = $(this).attr('href');
    var $score = $(this).closest('.vote-container').find("strong");
    $.ajax({
      url: $link,
    }).done(function(response){
      $score.text(response);
    });
  });

  $('.votedown').on('click',function(event){
    event.preventDefault();
    var $link = $(this).attr('href');
    var $score = $(this).closest('.vote-container').find("strong");
    $.ajax({
      url: $link,
    }).done(function(response){
      $score.text(response);
    });
  });

});

