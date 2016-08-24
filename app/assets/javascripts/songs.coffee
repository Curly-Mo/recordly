# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
ready = ->
  tracks = document.querySelectorAll('.track-item');
  for track in tracks
    track.addEventListener('click', (e) =>
      audio = e.target.querySelector('audio')
      if audio != null && audio.paused
        audios = document.querySelectorAll('audio');
        for a in audios
          a.pause()
        audio.play()
      else
        audio.pause() if audio != null
    );

document.addEventListener("turbolinks:load", ready)
