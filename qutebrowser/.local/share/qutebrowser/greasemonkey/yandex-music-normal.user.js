// ==UserScript==
// @name          Yandex.Music normal
// @namespace     http://userstyles.org
// @description	  Like the title says^^
// @author        Mikle_Bond
// @run-at        document-start
// @version       0.20180226020745
// ==/UserScript==
(function() {

var css = "";
if (!document.location.href.match("(https?:)?\/\/music.yandex.ru\/.*")) 
	return;
css += [ ""
	,"div.bar-below {height:0;}"
	,"div.centerblock-wrapper {width: 100% !important;}"
	,"div.multi-auth__plus {background-image: none;}"
	,"div.d-devider + li.multi-auth__line {height:0;padding-left:100%;overflow-x:hidden;}"
	,"div.d-overhead-mobile + div:not(.head) {height:0;transform:translateY(-100%);}"
	,"div.d-overhead-mobile + div:not(.head) img {height:0;background:none !important;}"
].join("\n");
console.log("fuck");
if (typeof GM_addStyle != "undefined") {
	GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
	PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
	addStyle(css);
} else {
	var node = document.createElement("style");
	node.type = "text/css";
	node.appendChild(document.createTextNode(css));
	var heads = document.getElementsByTagName("head");
	if (heads.length > 0) {
		heads[0].appendChild(node);
	} else {
		// no head yet, stick it whereever
		document.documentElement.appendChild(node);
	}
}
})();

