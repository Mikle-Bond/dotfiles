// ==UserScript==
// @name          Global Dark Theme -- MyStyle
// @namespace     http://userstyles.org
// @author        Mikle_Bond
// @run-at        document-start
// @version       0.20190316205008
// ==/UserScript==
(function() { var css = "";
  if(false || (new RegExp("^https?://(?!(forum.example.com|([^/]+\.)?shikimori.org|([^/]+\.)?play.shikimori.org|([^/]+\.)?vk.com|([^/]+\.)?music.yandex.ru|([^/]+\.)?youtube.com|([^/]+\.)?www.youtube.com|([^/]+\.)?nyaa.si|([^/]+\.)?css-tricks.com|([^/]+\.)?codepen.io|([^/]+\.)?store.steampowered.com|([^/]+\.)?userstyles.org|([^/]+\.)?reddit.com|([^/]+\.)?learnrubythehardway.org|([^/]+\.)?googleusercontent.com|([^/]+\.)?pikabu.ru|([^/]+\.)?dotshare.it|([^/]+\.)?web.telegram.org|([^/]+\.)?terminal.sexy)).*$")).test(document.location.href)
 || (document.location.href.indexOf("ftp://") == 0) || (document.location.href.indexOf("file://") == 0) || (document.location.href.indexOf("qute://help") == 0) || (document.location.href.indexOf("chrome://") == 0) || (document.location.href.indexOf("about") == 0) || (document.location.href.indexOf("javascript") == 0) || (document.location.href.indexOf("data:text/html;") == 0))
    css += [ ""
    ,"/* This file originates from Owl plugin for Firefox."
    ," * The original version can be found here: https://github.com/CptFoobar/Owl"
    ," */"
    ,"html {"
    ,"    filter: invert(95%) hue-rotate(180deg) brightness(110%) contrast(90%) !important; overflow: auto;"
    ,"}"
    ,":-webkit-full-screen:not(iframe),"
    ,"img,"
    ,"*:not(object):not(body)>embed:not(video),"
    ,"object,"
    ,"*[style*=\"background:url\"]:empty,"
    ,"*[style*=\"background-image:url\"]:empty,"
    ,"*[style*=\"background: url\"]:empty,"
    ,"*[style*=\"background-image: url\"]:empty {"
    ,"    filter: brightness(95%) invert(105%) hue-rotate(180deg) !important;"
    ,"}"
    ,"a[title^=\"Google Account: \"]>span,"
    ,"a[aria-label=\"Change profile picture.\"] div[title=\"Profile\"]"
    ,"{"
    ,"    filter: brightness(90%) invert(95%) hue-rotate(180deg) !important;"
    ,"}"
    ,".pE, .HH{"
    ,"    filter: brightness(90%) invert(95%) hue-rotate(180deg) !important;"
    ,"}"
    ,".du.ew, div.l9 > div:not(.I7) {"
    ,"    filter: invert(95%);"
    ,"}"
    ,"video {"
    ,"    filter: brightness(95%) invert(105%) hue-rotate(180deg) contrast(111%) !important;"
    ,"}"
    ,"iframe > html,"
    ,":-moz-full-screen * {"
    ,"    filter: none !important;"
    ,"}"
    ,"img.mwe-math-fallback-image-inline {"
    ,"    filter: none !important;"
    ,"}"
    ,"html {"
    ,"    background-color: rgb(30, 30, 30) !important;"
    ,"    overflow: auto;"
    ,"    min-height: 100%;"
    ,"}"
    ,".irc_bg {"
    ,"    background-color: #2b2b2b;"
    ,"}"
    ,"#irc_cc {"
    ,"    background-color: #dfdfdf;"
    ,"}"
    ,".irc_pt, ._Hcb{"
    ,"    color: #383838;"
    ,"}"
    ,"::-webkit-scrollbar {"
    ,"    max-width: 10px !important;"
    ,"    max-height: 10px !important;"
    ,"    background: var(--background) !important;"
    ,"}"
    ,"::-webkit-scrollbar-track,"
    ,"::-webkit-scrollbar-corner {"
    ,"    background: var(--background) !important;"
    ,"}"
    ,"::-webkit-scrollbar-thumb {"
    ,"    background: rgba(80, 80, 80, 0.6) !important;"
    ,"}"
    ,"::-webkit-scrollbar-thumb:hover {"
    ,"    background: rgba(96, 96, 96, 0.6) !important;"
    ,"}"
    ,".Row.Pend-10 {"
    ,"    background: #f9f9f9 !important;"
    ,"}"
    ,"div.suggester-container {"
    ,"    transform: none !important;"
    ,"}"
    ,"g-scrolling-carousel > div {"
    ,"    transform: none !important;"
    ,"}"
    ,"/*"
    ,"youtube player fix:"
    ,"iframe, .html5-video-player, .has-custom-banner, #theater-background, *:not(.html5-video-player):not(.channel-header-profile-image-container):not(.html5-storyboard-filmstrip):not(.html5-storyboard-framepreview):not(.html5-storyboard-lens) > img {"
    ,"filter: invert(100%) hue-rotate(180deg) brightness(110%) contrast(90%) !important;"
    ,"}"
    ,"*/"
    ].join("\n");
/*
  if (typeof GM_addStyle != "undefined") {
    GM_addStyle(css);
  } else if (typeof PRO_addStyle != "undefined") {
    PRO_addStyle(css);
  } else if (typeof addStyle != "undefined") {
    addStyle(css);
  } else {
*/
    var heads = document.getElementsByTagName("head");
    if (heads.length > 0) {
      var node = document.createElement("style");
      node.type = "text/css";
      node.id = "qutebrowser-globaltheme"
      node.appendChild(document.createTextNode(css));
      heads[0].appendChild(node); 
    }
/*
  }
*/
})();
