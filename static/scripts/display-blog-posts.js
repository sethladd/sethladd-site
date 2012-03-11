
(function() {

  google.load("feeds", "1", "Feed");

  function loadAndDisplayPosts() {
    var feed = new google.feeds.Feed("http://blog.sethladd.com/feeds/posts/default");
    feed.load(function(result) {
      if (!result.error) {
        var container = document.getElementById("feed-posts");
        var ul = document.createElement("ul");
        for (var i = 0; i < result.feed.entries.length; i++) {
          var entry = result.feed.entries[i];
          var li = document.createElement("li");
          var a = document.createElement("a");
          a.setAttribute('href', entry.link);
          a.appendChild(document.createTextNode(entry.title));
          li.appendChild(a);
          ul.appendChild(li);
        }
        container.appendChild(ul);
      }
    });
  }
  google.setOnLoadCallback(loadAndDisplayPosts);
})();