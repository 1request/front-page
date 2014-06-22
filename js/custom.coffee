$ ->
  $.stellar()

  $('#contact').submit (e) ->
    e.preventDefault()

    name = $('input[name="name"]').val()
    email = $('input[name="email"]').val()
    message = $('textarea[name="message"]').val()

    unless !!name and !!email and !!message
      noty({text: 'please fill in necessary fields', type: 'error'})
    else
      $.ajax
        url: 'http://localhost:8080/api/contacts'
        type: 'POST'
        data:
          name: name
          email: email
          message: message
        dataType: 'json'
        success: (data, textStatus, XHR) ->
          noty({text: 'Message sent successfully! We will contact you shorty', type: 'success'})
        error: (XHR, textStatus, error) ->
          noty({text: 'Something is wrong, please try again', type: 'error'})
