# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(window).load ->
  tracks = document.querySelectorAll('.track-item');
  for track in tracks
    track.addEventListener('click', (e) =>
      audio = track.querySelector('audio')
      if audio.paused
        audios = document.querySelectorAll('audio');
        for a in audio
          a.pause()
        audio.play()
      else
        audio.pause()
    );
