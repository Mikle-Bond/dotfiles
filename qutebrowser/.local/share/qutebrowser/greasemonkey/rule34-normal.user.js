// ==UserScript==
// @name          rule34 normal
// @namespace     http://userstyles.org
// @description	  Like the title says^^
// @author        Mikle_Bond
// @run-at        document-start
// @version       0.20180226020745
// ==/UserScript==
(function() {

var css = "";
if (document.location.href.match("(https?:)?\/\/rule34.xxx\/.*")) 
	css += [ ""
		,"iframe[src^=\"https://ads\.\"] { display:none; }"
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

