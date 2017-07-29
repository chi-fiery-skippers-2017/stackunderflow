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


  $('.voteup').on('click',function(event){
    event.preventDefault();
    var $link = $(this).attr('href');
    var $score = $(this).closest('.votes').find("strong");
    $.ajax({
      url: $link,
    }).done(function(response){
      $score.text(response);
    });
  });

  $('.votedown').on('click',function(event){
    event.preventDefault();
    var $link = $(this).attr('href');
    var $score = $(this).closest('.votes').find("strong");
    $.ajax({
      url: $link,
    }).done(function(response){
      $score.text(response);
    });
  });

  //adding new comment
  // $('.add_comment_button').on('click',function(){
  //   event.preventDefault();
  //   $(this).css('display', 'none');
  //   $(this).parent().find('.add_comment_form').css('display', 'inline');
  //   var $link = $(this).parent().find('.add_comment_form').attr('action');
  //   var $info = $(this).parent().serialize();
  //   console.log($info);
  //   $.ajax({
  //     url: $link,
  //     method: "POST",
  //     data: $info
  //   }).done(function(response){
  //     //insert new comment
  //     // console.log($(this).closest('add_comments'));
  //     console.log(response);
  //     $('.post_comment_button').on('click', function(){
  //       event.preventDefault();
  //     })
  //   })
  // })

  $(".add_comment_button").on("click", function(event){
    event.preventDefault();
    $(this).css('display', 'none');
    $(this).parent().find('.add_comment_form').css('display', 'inline');
  });

  $(".add_comment_form").on("submit", function(event){
    event.preventDefault();
    var $this = $(this);
    var answerComment = $(this).serialize();
    var url = $this.closest('form').attr('action');
    var type = $this.attr('method');

    $.ajax({
      data: answerComment,
      url: url,
      type: type
    })

    .done(function(response) {
      $(".show_main_container").append(response);
      console.log("success");
      $this.css('display', 'none');
      $this.parent().find('.add_comment_button').css('display', 'inline');
      $this.children().first().val("")
    })
  })



});















