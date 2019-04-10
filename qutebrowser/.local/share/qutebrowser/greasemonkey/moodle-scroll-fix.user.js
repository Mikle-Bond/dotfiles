// ==UserScript==
// @name          Moodle Scroll fixer
// @namespace     http://userstyles.org
// @description	  Removes unnecessary DOM rebuild on scroll event
// @author        Mikle_Bond
// @run-at        document-start
// @version       0.20180226020745
// ==/UserScript==
(function() {
	window.addEventListener("scroll", event => {
		event.stopPropagation();
	}, true)
})()

