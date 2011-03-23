$(function() {
  $('a.new').click(function() {
    var link = $(this);
    $.get(link.attr('href'), {}, function(data) {
      $('form.new_message').remove();
      link.after(data);
    }, 'html');
    return false;
  });

  var Message = function() {
    var message = $(this);
    message.find('.reply').click(function() {
      $.get($(this).attr('href'), {}, function(data) {
        $('form.new_message').remove();
        message.append(data);
      }, 'html');
      return false;
    });

    message.find('.in-reply-to').click(function() {
      $($(this).attr('href')).addClass('highlighted');
    });
  }

  $('#messages li').each(Message);

  setInterval(function() {
    $.get('/', {}, function(data) {
      $(data).find('li').each(function() {
        var newMessage = $(this);
        if(!$('#' + newMessage.attr('id')).length) {
          $('#messages').prepend(newMessage);
          Message(newMessage);
        }
      });
    }, 'html');
  }, 1000);
});
