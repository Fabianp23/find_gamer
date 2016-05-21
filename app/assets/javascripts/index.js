$(document).on("ready page:load", ready);

  $(".chosen-choices").chosen();

  function ready() {
    highlightInputBox();

    $('#language-button :input').on('click', clearInput);

    function clearInput(){
      $('#language-button :input').val("");
  };

  function highlightInputBox() {
    $('.new-form :input').on('click', function() {
      $(this).css('border', 'solid 1px #F8AC00');
    });
  };

  $('.new_post input, .new_post textarea, .new_post select').on('blur', function(){
    $(this).css('border', 'solid 1px #F8AC00');
  });

  $('.new_post').on('ajax:success', function(evt, postPartial){
    clearErrors();
    $('.new_post input[type=text], .new_post textarea, .new_post select').val("");
    $(".all-posts").prepend(postPartial);
  });

  $('.new-form').on('ajax:error', function(evt, xhr, status, error){
    clearErrors();
     errors = xhr.responseJSON;
     var errorsArr = [];
    //  console.log(evt, xhr, status, errors)
     if (errors.language) {
       errorsArr.push("Language " + errors.language[0]);
     }
     if (errors.description) {
       errorsArr.push("Description " + errors.description[0]);
     }
     if (errors.game_id) {
       errorsArr.push("Game " + errors.game_id[0]);
     }
     if (errors.gamertag) {
       errorsArr.push("Gamertag " + errors.gamertag[0]);
     }
     if (errors.console) {
       errorsArr.push("Console " + errors.console[0]);
     }
     errorsArr.forEach(addError);
  });

$("#game_id").chosen().change( function(event, data){
   window.location.href = "/games/" + data.selected;
   });

  function clearErrors(){
    $('.errors').remove();
  };

  function addError(element, index, array){
    $('.new-form').prepend("<li class='errors'>" + element + '</li>');
  };

  function getAllPosts() {
    return $.ajax({
      url: 'posts',
      success: function (div) {
        $('.all-posts').html(div);
      }
    });
  }

  console.log(window.intervalId);
  if (window.intervalId === undefined) {
    window.intervalId = setInterval(getAllPosts, 3000);
  }
}
