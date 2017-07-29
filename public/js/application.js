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

