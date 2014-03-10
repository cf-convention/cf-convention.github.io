function showVideo(id){
    //function will change the src link the youTube iFrame is point to.
    var myVideos = new Array( "http://www.youtube.com/embed/6-bcWSfbfYU",
                              "http://www.youtube.com/embed/W8OgdW40HVQ",
                              "http://www.youtube.com/embed/WKP9eMGLP8s",
                              "http://www.youtube.com/embed/rlNUzcL3pqM",
                              "");

    var video = myVideos[id];
    $('#videoPlayer').attr('src', video);
  }


