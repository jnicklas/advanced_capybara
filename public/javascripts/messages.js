$(function() {
  $('#new_message').each(function() {
    var form = $(this)
    form.submit(function() {
      $.ajax({
        url: form.attr('action'),
        data: form.serialize(),
        type: 'POST',
        success: function(data) {
          $('#messages').html(data);
        }
      });
      return false;
    });
  });

  setInterval(function() {
    $.ajax({
      url: '/',
      data: {},
      success: function(data) {
        $('#messages').html(data);
      }
    });
  }, 1000);
});
