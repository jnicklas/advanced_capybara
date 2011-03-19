$(function() {
  $('#new_message').each(function() {
    var form = $(this)
    form.submit(function() {
      $.ajax({
        url: form.attr('action'),
        data: form.serialize(),
        type: 'POST',
        accepts: 'text/javascript',
        success: function(data) {
          console.log(data)
          console.log($('#messages'))
          $('#messages').html(data);
        }
      });
      return false;
    });
  });
});
