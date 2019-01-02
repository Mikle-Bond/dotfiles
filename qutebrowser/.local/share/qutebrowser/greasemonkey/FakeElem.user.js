// ==UserScript==
// @name          FakeElem
// @namespace     http://userstyles.org
// @description	  Add fake element to any page, so it can be fakeclicked
// @author        Mikle_Bond
// @include       http://*
// @include       https://*
// @run-at        document-start
// @version       0.01
// ==/UserScript==

(function() {
	var node = document.createElement("div");
	node.style.display = "none";
	node.id = "qutebrowser-fakeelem"

	var bod = document.getElementsByTagName("body");
	if (bod.length > 0) {
		bod[0].appendChild(node);
	} else {
		// no head yet, stick it whereever
		document.documentElement.appendChild(node);
	}
})();
