$(document).on("ready page:load", ready);

function ready() {
  highlightInputBox();

  $('#language-button :input').on('click', clearInput);

  function clearInput(){
    $('#language-button :input').val("");
  };

  function highlightInputBox() {
    $('.new-form :input').on('click', function() {
      $(this).css('border', 'solid 1px #C62030');
    });
  };

  $('.new_post input, .new_post textarea, .new_post select').on('blur', function(){
    $(this).css('border', 'solid 1px #C62030');
  });

  $('.new_post').on('ajax:success', function(evt, postPartial){
    $('.new_post input[type=text], .new_post textarea, .new_post select').val("");
    $(".all-posts").prepend(postPartial);
  });

  function getAllPosts() {
    return $.ajax({
      url: 'posts',
      success: function (div) {
        $('.all-posts').html(div);
      }
    });
  }

  setInterval(getAllPosts, 3000);
}
