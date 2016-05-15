$(document).ready(function(){
  clearInput();
  highlightInputBox();

  function clearInput(){
    $('#language-button :input').on('click', function() {
      $(this).val("");
    });
  };

  function highlightInputBox() {
    $('#new-form :input').on('click', function() {
      $(this).css('border', 'solid 1px #C62030');
    });
  }

  // function validateForm() {
  // $('#new-form').validate({
  //   debug: true,
  //     rules: {
  //       "post[console]": {required: true},
  //       "post[gamertag]": {required: true, maxlength: 16},
  //       "post[game]": {required: true, maxlength: 20},
  //       "post[description]": {required: true, maxlength: 200},
  //       "post[language]": {required: true, maxlength: 20}
  //     }
  //   });
  // };

});
