// ==UserScript==
// @name          NNM-club - чистый трекер  [ v0.1.1 ] + AdBlock
// @namespace     http://userstyles.org
// @description	  Более современный и лаконичный вид трекера, а так же 
// @author        Desigher
// @homepage      https://userstyles.org/styles/109178
// @include       http://nnm-club.me/forum/tracker.php*
// @include       http://nnmclub.to/forum/tracker.php*
// @include       http://nnm-club.name/tracker.php*
// @include       http://nnm-club.tv/forum/tracker.php*
// @include       http://nnm-club.me/*
// @include       https://nnm-club.me/*
// @include       http://*.nnm-club.me/*
// @include       https://*.nnm-club.me/*
// @include       http://nnmclub.to/*
// @include       https://nnmclub.to/*
// @include       http://*.nnmclub.to/*
// @include       https://*.nnmclub.to/*
// @include       http://nnm-club.name/*
// @include       https://nnm-club.name/*
// @include       http://*.nnm-club.name/*
// @include       https://*.nnm-club.name/*
// @include       http://nnm-club.tv/*
// @include       https://nnm-club.tv/*
// @include       http://*.nnm-club.tv/*
// @include       https://*.nnm-club.tv/*
// @include       http://nnm-club.me/forum/viewtopic.php*
// @include       http://nnmclub.to/forum/viewtopic.php*
// @include       http://nnm-club.name/forum/viewtopic.php*
// @include       http://nnm-club.tv/forum/viewtopic.php*
// @run-at        document-start
// @version       0.20180409093229
// ==/UserScript==
(function() {var css = "";
if (false || (document.location.href.indexOf("http://nnm-club.me/forum/tracker.php") == 0) || (document.location.href.indexOf("http://nnmclub.to/forum/tracker.php") == 0) || (document.location.href.indexOf("http://nnm-club.name/tracker.php") == 0) || (document.location.href.indexOf("http://nnm-club.tv/forum/tracker.php") == 0))
	css += [
		"a.topictitle:link {",
		"    text-decoration: none !important;",
		"    color: #2b4157;",
		"}",
		"a.topictitle:visited {",
		"    color: #9DB7D2 !important;",
		"}",
		"a:hover {",
		"    text-decoration: none !important;",
		"    color: #3D68C5 !important;",
		"}",
		"hr {",
		"    height: 0;",
		"    border: 1px dotted #D5E0EC;",
		"    border-top-width: 1px;",
		"    border-bottom-width: 0;",
		"}",
		".prow2 {",
		"    background-color: #FFFFFF !important;",
		"}",
		".prow1 {",
		"    background-color: #FAFDFF !important;",
		"}",
		".forumline td {",
		"    padding: 0px 5px;",
		"}",
		".forumline.tablesorter tr:hover {",
		"    background-color: #EAEFFF !important;",
		"    color: #3D68C5 !important;",
		"}",
		"fieldset {",
		"    display: block;",
		"    -webkit-margin-start: 2px;",
		"    -webkit-margin-end: 2px;",
		"    -webkit-padding-before: 0.35em;",
		"    -webkit-padding-start: 0.75em;",
		"    -webkit-padding-end: 0.75em;",
		"    -webkit-padding-after: 0.625em;",
		"    border: 1px solid #EEEEEE;",
		"    border-image-source: initial;",
		"    border-image-slice: initial;",
		"    border-image-width: initial;",
		"    border-image-outset: initial;",
		"    border-image-repeat: initial;",
		"    min-width: -webkit-min-content;",
		"}",
		"legend {",
		"    color: #7A7A94;",
		"}",
		".pcatHead {",
		"    background-color: #6699CC !important;",
		"    background-image: none !important;",
		"    border-radius: 2px;",
		"    height: 36px;",
		"    padding: 3px 0px 2px 10px;",
		"}",
		"form#search_form table:nth-last-child(1) {",
		"    padding: 15px 0px;",
		"}",
		".pgenmed {",
		"    font-size: 14px;",
		"    text-shadow: 1px 1px 0.5px rgba(0, 0, 0, 0.32);",
		"    font-family: Arial;",
		"    color: #FFFFFF;",
		"}",
		"a.pgenmed:hover {",
		"    color: #FFFFFF !important;",
		"    text-shadow: 0px 0px 25px rgba(255, 255, 255, 1), 0px 0px 25px rgba(255, 255, 255, 1), 1px 1px 0px rgba(0, 0, 0, 0.47) !important;",
		"    transition: All 0.2s cubic-bezier(.11, 0, .02, 1);",
		"    text-decoration: none;",
		"}",
		"a.pgenmed {",
		"    transition: All 2s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"td.genmed {",
		"    max-width: 650px;",
		"    position: relative;",
		"}",
		"td.genmed img {",
		"    position: absolute;",
		"    right: 0;",
		"    top: 10px;",
		"}",
		".genmed a b {",
		"    padding: 10px 0;",
		"    width: 97%;",
		"    display: block;",
		"    float: left;",
		"}",
		".opened {",
		"    font-size: 10px;",
		"    margin-top: -10px;",
		"    display: inline-block;",
		"}",
		".substr {",
		"    padding-top: 2px;",
		"}",
		"th,",
		".top {",
		"    color: #FFF;",
		"    font-size: 9pt;",
		"    font-weight: bold;",
		"    background-image: none !important;",
		"    background-color: #69c !important;",
		"}",
		"div#CGCandy377 {",
		"    display: none;",
		"}",
		"td.copyright br {",
		"    display: none;",
		"}",
		"table.forumline td.tablesorter td.genmed {",
		"    min-width: 520px;",
		"}",
		"table.forumline tbody tr td.row1 {",
		"    background-color: #FFFFFF;",
		"    border-radius: 3px !important;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"    z-index: 999;",
		"    position: relative;",
		"    padding-top: 10px;",
		"}",
		"td.cat,",
		"td.catHead,",
		"td.catSides,",
		"td.catLeft,",
		"td.catRight,",
		"td.catBottom {",
		"    background-color: #eeeeee;",
		"}",
		"td.row1 table tbody tr td.row1 {",
		"    border-radius: 0px !important;",
		"    box-shadow: none;",
		"    z-index: 999;",
		"    position: relative;",
		"}",
		"table.forumline.tablesorter {",
		"    border-radius: 3px;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"    margin-bottom: 10px;",
		"    overflow: hidden;",
		"}",
		"table.forumline.tablesorter tfoot {",
		"    display: none;",
		"}",
		"td.catHead {",
		"    display: none;",
		"}",
		".copyright table {",
		"    display: none;",
		"}",
		".nav a[HREF *=\"index.php\"] {",
		"    margin: 0 !important;",
		"    padding: 0 !important;",
		"    background-color: inherit;",
		"}",
		".nav {",
		"    font-weight: bold;",
		"    font-size: 9pt;",
		"    color: #fff;",
		"    text-decoration: none;",
		"}",
		".nav b {",
		"    background-color: #6699CC;",
		"    padding: 8px 16px;",
		"    margin: 0px 5px;",
		"    border-radius: 3px;",
		"    color: #FFF;",
		"}",
		"span.nav > b {",
		"    color: #fff !important;",
		"}",
		"span.nav:nth-last-of-type(1) b:only-of-type {",
		"    margin-left: -12px;",
		"    margin-right: 10px;",
		"}",
		"[nowrap=\'nowrap\'] span.nav {",
		"    color: #EEE;",
		"}",
		"span.nav {",
		"    color: #BDBDBD;",
		"}",
		"span.nav a {",
		"    color: #6699CC;",
		"    padding: 8px 16px;",
		"    background-color: #FFF;",
		"    border-radius: 3px;",
		"    transition: all 0.3s ease;",
		"    text-decoration: none;",
		"    margin-left: -12px;",
		"    margin-right: 10px;",
		"}",
		"span.nav a:last-child {",
		"    margin-right: 0px;",
		"}",
		"span.nav a:hover {",
		"    color: #fff !important;",
		"    background-color: #7BACDC;",
		"    transition: all 0.2 ease;",
		"}"
	].join("\n");
if (false || (document.domain == "nnm-club.me" || document.domain.substring(document.domain.indexOf(".nnm-club.me") + 1) == "nnm-club.me") || (document.domain == "nnmclub.to" || document.domain.substring(document.domain.indexOf(".nnmclub.to") + 1) == "nnmclub.to") || (document.domain == "nnm-club.name" || document.domain.substring(document.domain.indexOf(".nnm-club.name") + 1) == "nnm-club.name") || (document.domain == "nnm-club.tv" || document.domain.substring(document.domain.indexOf(".nnm-club.tv") + 1) == "nnm-club.tv"))
	css += [
		".audioplayer,",
		".total-users,",
		".skin-block,",
		"td#adss.no-adb,",
		"td#adss center,",
		".request,",
		"div#x111,",
		".leftnav center,",
		"td#livi,",
		"#brTop,",
		"#twelveBranding,",
		".skin-block,",
		".tLogo,",
		"table.header td.row2 table:not(.menubot),",
		"body noindex {",
		"    display: none !important;",
		"}",
		"td#adb {",
		"    position: absolute;",
		"    top: -5000px;",
		"}",
		".wrap {",
		"    top: 0px !important;",
		"    left: 0px !important;",
		"    margin-top: inherit !important;",
		"    padding: 0px !important;",
		"}",
		"/* АНИМАЦИЯ */",
		"",
		"@-webkit-keyframes left {",
		"    from {",
		"        transform: translateY(100px);",
		"        opacity: 0;",
		"    }",
		"    to {",
		"        transform: translateY(0px);",
		"        opacity: 100;",
		"    }",
		"}",
		"@keyframes left {",
		"    from {",
		"        transform: translateY(100px);",
		"        opacity: 0;",
		"    }",
		"    to {",
		"        transform: translateY(0px);",
		"        opacity: 100;",
		"    }",
		"}",
		"@-webkit-keyframes right {",
		"    from {",
		"        transform: translateY(100px);",
		"        opacity: 0;",
		"    }",
		"    to {",
		"        transform: translateY(0px);",
		"        opacity: 100;",
		"    }",
		"}",
		"@keyframes right {",
		"    from {",
		"        transform: translateY(100px);",
		"        opacity: 0;",
		"    }",
		"    to {",
		"        transform: translateY(0px);",
		"        opacity: 100;",
		"    }",
		"}",
		"@-webkit-keyframes search {",
		"    from {",
		"        transform: translateY(-30px);",
		"        opacity: 0;",
		"    }",
		"    to {",
		"        transform: translateY(0px);",
		"        opacity: 100;",
		"    }",
		"}",
		"@keyframes search {",
		"    from {",
		"        transform: translateY(-30px);",
		"        opacity: 0;",
		"    }",
		"    to {",
		"        transform: translateY(0px);",
		"        opacity: 100;",
		"    }",
		"}",
		"",
		"",
		"",
		"/* АНИМАЦИЯ END */",
		"",
		"body {",
		"    background-color: #eeeeee !important;",
		"    background-size: contain;",
		"    background-image: none !important;",
		"    background: fixed 100%;",
		"    padding-top: 0px!important;",
		"    color: #000;",
		"}",
		".wrap {",
		"    position: absolute;",
		"    border-radius: 0px;",
		"    top: 0px;",
		"    margin-left: 50%;",
		"    margin-right: 50%;",
		"    left: -615px;",
		"}",
		"a {",
		"    text-decoration: none !important;",
		"}",
		"a:hover {",
		"    color: #168AFF !important",
		"}",
		"/*",
		"a.mainmenu[href=\'/\'] {",
		"    position: relative;",
		"    color: #75A8DA;",
		"    ",
		"}",
		"a.mainmenu[href=\'/\']:hover {",
		"    position: relative;",
		"    color: #84B1DE !important;",
		"    text-shadow: none !important;",
		"    ",
		"}",
		" a.mainmenu[href=\'/\']::after {",
		"    position:absolute; top: 0; left: 0; right: 0; bottom: 0;",
		"	content: \"Главная\";",
		"    color: #FFF;",
		"    transition: All 2s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"a.mainmenu[href=\'/\']:hover::after {",
		"    position:absolute; top: 0; left: 0; right: 0; bottom: 0; ",
		"	content: \"Главная\";",
		"    color: #FFF;",
		"    text-shadow: 1px 1px 0px rgba(0, 0, 6, 0.3), 0px 0px 25px rgba(255, 255, 255, 1), 0px 0px 25px rgba(255, 255, 255, 1);",
		"    transition: All 0.2s cubic-bezier(.11, 0, .02, 1);",
		"} ",
		"",
		"[height=\'75\'] [href=\'index.php\']:after {",
		"    content: \"Форум\";",
		"    color: #fff;",
		"    position: absolute;",
		"    top: 59px;",
		"    left: 496px;",
		"     transition: All 2s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"[height=\'75\'] [href=\'index.php\']:hover:after {",
		"    text-shadow: 1px 1px 0px rgba(0, 0, 6, 0.3), 0px 0px 25px rgba(255, 255, 255, 1), 0px 0px 25px rgba(255, 255, 255, 1);",
		"    transition: All 0.2s cubic-bezier(.11, 0, .02, 1);",
		"    color: #fff !important;",
		"}",
		"",
		"a[href=\'viewtopic.php?t=867\'] {display:none !important;}",
		"",
		"*/",
		"/* Поиск по трекеру  */",
		"",
		"td[width=\'20%\'] form[action=\'tracker.php\'] {",
		"    margin: 6px 0 5px 0;",
		"}",
		"input.mbutton {",
		"    font-weight: normal !important;",
		"    color: #FFF !important;",
		"    border: solid 0px !important;",
		"    background-color: #75a8da !important;",
		"    border-radius: 2px !important;",
		"    padding: 2px 15px 3px 14px !important;",
		"    font-size: 13px !important;",
		"    transition: all 0.2s ease;",
		"}",
		"input.mbutton:hover {",
		"    border: solid 0px;",
		"    background: #84B1DE !important;",
		"    transition: all 0.2s ease;",
		"}",
		"input.hint {",
		"    color: #bae0ec;",
		"    background-color: #5482b1;",
		"}",
		"input.hint:hover {",
		"    color: #ffffff;",
		"}",
		"input[value=\'Поиск по трекеру\'] {",
		"    width: 380px !important;",
		"    font-size: 11px !important;",
		"    border: 0px solid !important;",
		"    padding: 4px 8px 4px 8px;",
		"}",
		"input[value=\'Поиск по трекеру\']:hover {",
		"    border: 0px solid !important;",
		"}",
		"/* Поиск по трекеру конец  */",
		"",
		".menu ul {",
		"    z-index: 9999;",
		"}",
		".wrap {",
		"    border-radius: 0px;",
		"}",
		".header {",
		"    color: #FFF !important;",
		"    font-size: 9pt;",
		"    background-color: #69c !important;",
		"}",
		".menubot {",
		"    border: 0px;",
		"}",
		"a.mainmenu {",
		"    transition: All 2s cubic-bezier(.11, 0, .02, 1);",
		"    display: inline-block;",
		"    width: 200px;",
		"}",
		"a.mainmenu:hover {",
		"    text-decoration: none;",
		"    text-shadow: 1px 1px 0px rgba(0, 0, 6, 0.3), 0px 0px 25px rgba(255, 255, 255, 1), 0px 0px 25px rgba(255, 255, 255, 1);",
		"    transition: All 0.2s cubic-bezier(.11, 0, .02, 1);",
		"    color: #fff !important;",
		"}",
		"input.liteoption {",
		"    background-color: #6699CC;",
		"    font-weight: normal;",
		"    border-radius: 3px;",
		"    border: none;",
		"    padding: 7px 32px;",
		"    margin: 16px 2px 8px;",
		"    box-shadow: 0px 1px 1px 0px rgba(50, 50, 50, 0.3);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"    outline: none;",
		"    color: #fff;",
		"}",
		"input.liteoption:hover {",
		"    background-color: #7BACDC;",
		"    border: none;",
		"    box-shadow: 0px 2px 6px 0px rgba(50, 50, 50, 0.4);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"table.menutable tbody tr td table tbody tr td form input {",
		"    width: 500px !important;",
		"    padding: 5px 10px;",
		"}",
		"form[style=\'position:relative;margin-bottom:0;\'] {",
		"    position: inherit !important;",
		"}",
		"table.menutable tbody tr td table tbody tr td {",
		"    background: #75A8DA;",
		"    border-radius: 2px;",
		"    transition: all 0.2s ease;",
		"}",
		"table.menutable tbody tr td table tbody tr td:hover {",
		"    background: #84B1DE;",
		"    transition: all 0.2s ease;",
		"}",
		"a[href=\'tracker.php\'] {",
		"    font-size: inherit !important;",
		"}",
		"table.menutable tbody tr td table tbody tr td input {",
		"    BORDER: NONE;",
		"    background: #C9E4FF;",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"    position: absolute;",
		"    left: 5px;",
		"    top: 91px;",
		"    font-size: 11px !important;",
		"}",
		"table.menutable tbody tr td table tbody tr td input:focus {",
		"    background: #FFF;",
		"    ;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"table.menutable tbody tr td table tbody tr td input:hover {",
		"    background: #FFF;",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"[cellspacing=\'2\'] td[align=\'center\'] {",
		"    text-align: right;",
		"    padding: 2px 2px 8px;",
		"}",
		"table[cellspacing=\'2\'][cellpadding=\'0\'] {",
		"    border-collapse: collapse;",
		"}",
		".menutable {",
		"    background-image: none !important;",
		"    width: 100%;",
		"}",
		"table.menutable tbody tr td table {",
		"    width: 100%;",
		"}",
		".tg {",
		"    padding: 0px;",
		"    background-color: inherit;",
		"}",
		"table.header tbody tr td.row2 a {",
		"    color: #C0E0F3;",
		"}",
		"table.header tbody tr td.row2 a:hover {",
		"    color: #FFF !important;",
		"}",
		"table.header tbody tr td.row2 {",
		"    background-color: #6699CC;",
		"    color: #A1C2E2;",
		"    padding: 0;",
		"}",
		"table.header {",
		"    border-radius: 0px 0px 3px 3px;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"    padding-bottom: 6px;",
		"}",
		"/* портал */",
		"",
		".pline {",
		"    border: 0px;",
		"    border-radius: 2px;",
		"    background-color: #fff;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"    padding: 0 15px 7px;",
		"}",
		"td[width=\'80%\'] table.pline {",
		"    padding: 0 15px 7px;",
		"}",
		"td[width=\'80%\'] {",
		"    width: 70% !important;",
		"}",
		"td.pdl {",
		"    padding: 10px 0 0 0;",
		"}",
		".pcatHead {",
		"    background-color: #FFF;",
		"    background-image: none !important;",
		"    border-radius: 2px;",
		"    height: inherit;",
		"    background-repeat: repeat-x;",
		"    padding: 16px 0px 6px 0;",
		"    position: relative;",
		"}",
		".picon {",
		"    background-color: #6699CC;",
		"    padding: 8px 10px;",
		"    position: absolute;",
		"    top: -2px;",
		"    right: -25px;",
		"    border-radius: 0px 2px 0px 15px;",
		"}",
		".pcatHead h2 {",
		"    padding-left: 0 !important;",
		"    font-size: 16px;",
		"    line-height: 20px;",
		"}",
		".pgenmed {",
		"    font-size: 12pt;",
		"    text-shadow: none;",
		"    color: #000000;",
		"}",
		"a.pgenmed {",
		"    color: #000000;",
		"}",
		"a.pgenmed:hover {",
		"    color: #2b4157;",
		"}",
		"table.pline tbody tr td.row1 {",
		"    background-color: #FFFFFF;",
		"}",
		"input.post,",
		"textarea.post {",
		"    background-color: #fff;",
		"    border: 1px solid #ccc;",
		"    border-radius: 2px;",
		"    padding: 3px 5px;",
		"    outline: none;",
		"}",
		"input.post:focus,",
		"textarea.post:focus {",
		"    border: 1px solid #B5C9DD;",
		"    box-shadow: 0px 0px 10px 0px rgba(50, 50, 50, 0.2);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"input,",
		"textarea,",
		"select {",
		"    background-color: #fff;",
		"    border: 1px solid #ccc;",
		"    padding: 2px 5px;",
		"    border-radius: 2px;",
		"    outline: none;",
		"}",
		"input:hover,",
		"textarea:hover,",
		"select:hover {",
		"    border: 1px solid #B5C9DD;",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"form[name=\'search_block\'] {",
		"    margin-bottom: 10px;",
		"}",
		"span.gen select,",
		"span.gen input {",
		"    padding: 6px 5px;",
		"    border: 0px solid #B5C9DD;",
		"    box-shadow: 0px 1px 1px 0px rgba(50, 50, 50, 0.3);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"span.gen select:focus,",
		"span.gen input:focus {",
		"    padding: 6px 5px;",
		"    border: 0px solid #B5C9DD;",
		"    box-shadow: 0px 2px 6px 0px rgba(50, 50, 50, 0.4);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"span.gen input.liteoption {",
		"    padding: 7px 40px 8px;",
		"}",
		"div#CGCandy377 {",
		"    display: none;",
		"}",
		".copyright,",
		".copyright a {",
		"    color: #D0D0D0 !important;",
		"}",
		".seed,",
		".seedmed,",
		".seedsmall {",
		"    color: #2ECB2E;",
		"}",
		".leech,",
		".leechmed,",
		".leechsmall {",
		"    color: #E42B2B;",
		"}",
		".forumline {",
		"    background-color: #EEEEEE !important;",
		"    border-collapse: collapse;",
		"}",
		"hr {",
		"    border: solid #EEEEEE;",
		"    border-top-width: 1px;",
		"    border-bottom-width: 0;",
		"}",
		"table.header tbody tr td table tbody tr td a img {",
		"    display: none",
		"}",
		"td[width=\'40%\'][align=\'center\']:first-of-type {",
		"    text-align: left;",
		"    width: 20%;",
		"}",
		"td[width=\'40%\'][align=\'center\']:nth-last-of-type(1) {",
		"    text-align: right;",
		"    width: 20%;",
		"}",
		"table.header td[width=\'20%\'] {",
		"    width: 60%;",
		"}"
	].join("\n");
if (false || (document.location.href.indexOf("http://nnm-club.me/forum/viewtopic.php") == 0) || (document.location.href.indexOf("http://nnmclub.to/forum/viewtopic.php") == 0) || (document.location.href.indexOf("http://nnm-club.name/forum/viewtopic.php") == 0) || (document.location.href.indexOf("http://nnm-club.tv/forum/viewtopic.php") == 0))
	css += [
		"table[width=\'100%\'][cellspacing=\'2\'][cellpadding=\'2\']:first-of-type {",
		"    background-color: #fff;",
		"    vertical-align: middle;",
		"    padding: 10px 15px 14px;",
		"    margin: 18px 0px 0px;",
		"    border-radius: 3px 3px 0px 0px;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"}",
		"table[width=\'100%\'][cellspacing=\'2\'][cellpadding=\'2\']:first-of-type br {",
		"    display: none;",
		"}",
		"table[width=\'100%\'][cellspacing=\'2\'][cellpadding=\'2\']:nth-of-type(2) {",
		"    background-color: #FFFFFF;",
		"    overflow: hidden;",
		"    padding: 0px 14px;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"}",
		"table.forumline[cellpadding=\'6\'] {",
		"    background-color: #FFFFFF;",
		"    border-radius: 0px 0px 3px 3px;",
		"    overflow: hidden;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"    margin-bottom: 0;",
		"}",
		"table.forumline[cellpadding=\'6\'] tr,",
		"table.forumline[cellpadding=\'6\'] td {",
		"    background-color: #FFFFFF;",
		"    border: 0px;",
		"}",
		".row1 {",
		"    background-color: #FFF;",
		"}",
		".row2 {",
		"    background-color: #FFF;",
		"}",
		"table[style=\'background-color:#aec9e4;\'] {",
		"    background-color: #EEEEEE !important;",
		"    margin: 6px 0px 10px;",
		"}",
		"form[action=\'search.php?mode=results\'] input.hint {",
		"    background-color: #FFF !important;",
		"    color: #C5C5C5;",
		"    border: 0;",
		"}",
		"form[action=\'search.php?mode=results\'] > input,",
		"textarea,",
		"select {",
		"    background-color: #fff;",
		"    border: 0;",
		"    border-radius: 2px;",
		"    padding: 6px 5px;",
		"    box-shadow: 0px 1px 1px 0px rgba(50, 50, 50, 0.3);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"    outline: none;",
		"}",
		"form[action=\'search.php?mode=results\'] > input:focus {",
		"    box-shadow: 0px 2px 6px 0px rgba(50, 50, 50, 0.4);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"input[type=\'submit\'][name=\'search_submit\'][value=\'»\'] {",
		"    font-weight: bold;",
		"    font-size: smaller;",
		"    color: #f4f8fb;",
		"    background-color: #69c;",
		"    padding: 5px 20px 7px;",
		"}",
		"input[type=\'submit\'][name=\'search_submit\'][value=\'»\']:hover {",
		"    background-color: #7BACDC !important;",
		"    color: #fff;",
		"    border: none;",
		"    box-shadow: 0px 2px 6px 0px rgba(50, 50, 50, 0.4);",
		"    transition: All 0.3s cubic-bezier(.11, 0, .02, 1);",
		"    cursor: pointer;",
		"}",
		"th,",
		".top {",
		"    color: #FFF !important;",
		"    font-size: 9pt;",
		"    background-color: #69c !important;",
		"    background-image: none;",
		"}",
		"td.row1 {",
		"    background-color: #FFFFFF;",
		"    padding: 16px;",
		"}",
		"td.row2 {",
		"    background-color: #FFFFFF;",
		"    padding: 16px;",
		"}",
		"td.spaceRow {",
		"    display: none;",
		"}",
		".postbody {",
		"    font-size: 13px;",
		"    font-family: tahoma, Arial, Helvetica, sans-serif;",
		"    line-height: 18px;",
		"}",
		"tr.row1 {",
		"    border-bottom: 1px solid #EEE;",
		"}",
		"tr.row2 {",
		"    border-bottom: 1px solid #EEE;",
		"}",
		"b a[rel=\'nofollow\'] {",
		"    background-color: #2ECB2E;",
		"    color: #fff;",
		"    padding: 9px 0px;",
		"    border-radius: 3px;",
		"    display: block;",
		"    width: 90%;",
		"    text-decoration: none;",
		"    box-shadow: 0px 1px 1px 0px rgba(50, 50, 50, 0.3);",
		"    transition: All 0.5s cubic-bezier(.11, 0, .02, 1);",
		"}",
		"b a[rel=\'nofollow\']:hover {",
		"    color: #fff !important;",
		"    background-color: #4DEA4D;",
		"    text-decoration: none;",
		"    box-shadow: 0px 2px 6px 0px rgba(50, 50, 50, 0.4);",
		"    transition: All 0.2s cubic-bezier(.11, 0, .02, 1);",
		"}",
		".btTbl {",
		"    width: 100%;",
		"    background-color: #EEE;",
		"    border-radius: 3px;",
		"    overflow: hidden;",
		"}",
		".row3 {",
		"    background-color: #EEEEEE;",
		"}",
		"img[src=\'images/icon_arrow.gif\'],",
		"img[alt=\'Free Leech\'] {",
		"    display: none;",
		"}",
		".rowgold {",
		"    background-image: none;",
		"    background-color: #FFFABA;",
		"}",
		".forumline {",
		"    border-radius: 3px;",
		"    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);",
		"    margin-bottom: 10px;",
		"    overflow: hidden;",
		"}"
	].join("\n");
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
