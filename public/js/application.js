$(document).ready(function() {
  $("#postanswer").on("submit", function(event){
    event.preventDefault();
    var $this = $(this);
    var answerSubmission = $(this).serialize();
    var url = $this.closest('form').attr('action');
    var type = $this.closest('form').attr('method');

    $.ajax({
      data: answerSubmission,
      url: url,
      type: type
    })

    .done(function(response) {
      $(".container").append(response);
      console.log("success");
      $this.children().first().val("").focus();
    })
  })
})

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


