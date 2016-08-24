ready = ->
  heart = document.getElementById('artist-heart')
  if heart != null
    heart.addEventListener('change', (e) =>
      link = e.target.getAttribute('data-link');
      id = e.target.getAttribute('data-id');
      if e.target.checked
        request_type = 'POST';
      else
        request_type = 'DELETE';
      type = 'favorite_' + link;
      field_name = link + '_id';
      data = {};
      data[type] = {};
      data[type][field_name] = id;
      console.log(data)

      url = '/' + type + 's.json';
      xhr = new XMLHttpRequest();
      xhr.open(request_type, url, true);
      token = $('meta[name=csrf-token]').attr('content');
      xhr.setRequestHeader('X-CSRF-Token', token);
      xhr.setRequestHeader("Content-type", "application/json");
      xhr.send(JSON.stringify(data));
      console.log(xhr);
      console.log(url);
    );

document.addEventListener("turbolinks:load", ready)
