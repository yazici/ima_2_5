﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0114)http://msdn.microsoft.com/msdn-online/shared/components/ratings/ratings.aspx?opt=1&ContentID=_672194&HideDiscuss=1 -->
<HTML><HEAD><TITLE>Page Stats</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content=noindex name=robots>
<META content=build name=168><LINK href="ratings_files/ie4.css" type=text/css 
rel=stylesheet>
<STYLE>.RatingsData {
	BEHAVIOR: url(#default#userdata)
}
</STYLE>

<SCRIPT language=javascript defer>
		<!--
			var strPrintPage = ValidatePrintPage("print.asp");
			var bMNP2 = false;
			var strEmailString = "_r=1";
			window.onload = OnInitPage;
			function GetContentWnd(){ return parent; }
			function OnInitPage(){
				var oWnd = GetContentWnd();
				var strQuery = oWnd.location.search;
				
				if( document.getElementById("RatingsServerCmd").value == "" ) // first time only
				{
					document.getElementById("RatingsServerCmd").value = "/";
					document.getElementById("RatingsContentURL").value = oWnd.location.href;
					document.getElementById("RatingsContentTitle").value = oWnd.document.title;

					if(strQuery.indexOf(strEmailString) >= 0){
						document.getElementById("RatingsServerCmd").value = "SaveReturnFromEmail";
						document.forms(0).submit();
						return;
					}
				}
			}
			function ValidatePrintPage(sz){
				if( (sz.indexOf("\\") >=0) || (sz.indexOf("/") >=0) )
					return "print.asp";
				return sz;
			}
			function OnPrint(){
				if(bMNP2) OnPrintPage();
				else OnPrintFrame();
			}
			function OnPrintPage(){
				var oWnd = GetContentWnd();
				var oDoc = oWnd.document;
				var strLoc = oWnd.location.href;
				strLoc = strLoc.substr(0, strLoc.lastIndexOf("/")+1)+strPrintPage;
				if (window.navigator.userAgent.indexOf("MSIE ")!=-1 && navigator.appVersion.substr(0, 1) >= 4){
					if( oWnd.printHiddenFrame == null){
						oDoc.body.insertAdjacentHTML("beforeEnd", "<iframe name='printHiddenFrame' width='0' height='0'></iframe>");
						framedoc = oWnd.printHiddenFrame.document;
						framedoc.open();
						framedoc.write(
							"<frameset name=test onload='printMe.focus();printMe.print();' rows=\"100%\">" +
							"<frame name=printMe src=\""+strLoc+"\">" +
							"</frameset>");
						framedoc.close();
					}
					else{
						oWnd.printHiddenFrame.printMe.focus();
						oWnd.printHiddenFrame.printMe.print();
					}
				}
				else{
					oWnd.location.href = strLoc;
				}
				return true;
			}
			function OnPrintFrame(){
				var oWnd = GetContentWnd();
				oWnd.focus();
				oWnd.print();
				return true;
			}
			function OnEmail(){
				var oWnd = 	GetContentWnd();
				var oDoc = oWnd.document;
				var oDescription = oDoc.getElementById("Description");
				var strDescription = ( (oDescription == null) || (oDescription.content == "") ) ? oDoc.title : oDescription.content;
				if( oDoc.title == "" )
					oWnd.location.href = "mailto:?body="+BuildEmailDescription(strDescription, AddParamToURL(oWnd.location.href, strEmailString));
				else
					oWnd.location.href = "mailto:?subject="+escape(oDoc.title)+"&body="+BuildEmailDescription(strDescription, AddParamToURL(oWnd.location.href, strEmailString));
				return true;
			}
			function BuildEmailDescription(strDescription,hRef){
				return escape("Here's a great article you might be interested in:" +
							String.fromCharCode(13)+ String.fromCharCode(13) + strDescription + String.fromCharCode(13) + "URL: " + hRef);
			}
			function AddParamToURL(strLoc,strParam){
				var i = strLoc.lastIndexOf("?");
				if(strLoc.indexOf(strParam, i) >= 0)
					return strLoc;

				strLoc += ((i >= 0) && (i > strLoc.lastIndexOf("/"))) ? "&" : "?";
				return strLoc + strParam;
			}
			function OnDiscuss(ContentID){
				var strCmd = "/library/shared/comments/asp/threadedcomments.asp?";
				strCmd += "aID=" + ContentID;

				var nHeight = (window.screen.availHeight < 560) ? window.screen.availHeight-50 : 560;
				var nWidth = (window.screen.availWidth < 640) ? window.screen.availWidth-50 : 640;
				var nTop = window.screen.availHeight*2/5 - nHeight/2;
				var nLeft = window.screen.availWidth/2 - nWidth/2;
				if(nTop < 0) nTop = 0;
				if(nLeft < 0) nLeft = 0;

				var strOpts = "resizable=yes,menubar=yes,status=yes,toolbar=no,height="+String(nHeight)+",width="+String(nWidth);
				if(navigator.appName.toUpperCase() == "NETSCAPE")
					strOpts = "screenX=" + String( nLeft ) + ",screenY=" + String( nTop ) + "," + strOpts;
				else
					strOpts = "left=" + String( nLeft ) + ",top=" + String( nTop ) + "," + strOpts;

				var oWnd = window.open(strCmd, "RatingsForum", strOpts);
				if(oWnd == null)
					return false;

				oWnd.focus();
				return true;
			}
			function OnSave(){
				var oWnd = GetContentWnd();
				window.external.addFavorite( oWnd.location.href, oWnd.document.title );
				return true;
			}
			function OnRate(){
				var oWnd = GetContentWnd();
				oWnd.scrollBy(0, 9999999);
				return false;
			}
			function OnStats(ContentID){
				var strCmd = window.location.href+"&stats=1";
				var nHeight = 270;
				var nWidth = 357
				var nTop = window.screen.availHeight*2/5 - nHeight/2;
				var nLeft = window.screen.availWidth/2 - nWidth/2;
				if(nTop < 0) nTop = 0;
				if(nLeft < 0) nLeft = 0;

				var strOpts = "resizable=no,menubar=no,status=no,toolbar=no,height="+String(nHeight)+",width="+String(nWidth);
				if(navigator.appName.toUpperCase() == "NETSCAPE")
					strOpts = "screenX=" + String( nLeft ) + ",screenY=" + String( nTop ) + "," + strOpts;
				else
					strOpts = "left=" + String( nLeft ) + ",top=" + String( nTop ) + "," + strOpts;

				var oWnd = window.open(strCmd, "RatingsStats", strOpts);
				if(oWnd == null)
					return false;

				oWnd.focus();
				return true;
			}
			function SetRateID(sContentID){
				if( (sContentID == null) && (sContentID == "") )
					return;
				oInput = document.getElementById("RatingsStatus")
				oInput.setAttribute("Rate", oInput.value);
				oInput.save(sContentID);
			}
			function GetRateID(sContentID){
				oInput = document.getElementById("RatingsStatus")
				oInput.load(sContentID);
				oInput.value = oInput.getAttribute("Rate");
			}
					//-->
		</SCRIPT>

<META content="MSHTML 6.00.2800.1498" name=GENERATOR></HEAD>
<BODY style="MARGIN: 0px" bgColor=#f1f1f1 ms_positioning="GridLayout">
<FORM id=ratings_tmp name=ratings_tmp 
action=ratings.aspx?opt=1&amp;ContentID=_672194&amp;HideDiscuss=1 
method=post><INPUT type=hidden name=__EVENTTARGET> <INPUT type=hidden 
name=__EVENTARGUMENT> <INPUT type=hidden 
value=dDwxMDM3Mjg1ODQ5O3Q8cDxsPEhpZGVEaXNjdXNzO0NvdW50VGV4dDtSYXRlQ291bnQ7Q291bnRGaXJzdFRleHQ7Tm9SYXRpbmc7UGFnZVJhdGU7Qm9yZGVyQ29sb3I7UGFnZVJhbmdlO0JhY2tDb2xvcjtBdmVyYWdlVGV4dDs+O2w8XGU7XDxTVFJPTkdcPnswOkd9XDwvU1RST05HXD4gcGVvcGxlIGhhdmUgcmF0ZWQgdGhpcyBwYWdlO2k8Mzc0PjtcPFNUUk9OR1w+MVw8L1NUUk9OR1w+IHBlcnNvbiBoYXMgcmF0ZWQgdGhpcyBwYWdlO1w8U1RST05HXD5CZSB0aGUgZmlyc3QgdG8gcmF0ZSB0aGlzIHBhZ2UhXDwvU1RST05HXD47U3lzdGVtLlNpbmdsZSwgbXNjb3JsaWIsIFZlcnNpb249MS4wLjUwMDAuMCwgQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj1iNzdhNWM1NjE5MzRlMDg5PDkzLjMxPjsjOTk5OTk5O2k8OT47I2YxZjFmMTtBdmVyYWdlIHJhdGluZzpcPEJSXD5cPFNUUk9OR1w+ezA6R31cPC9TVFJPTkdcPiBvdXQgb2YgezE6R307Pj47bDxpPDE+Oz47bDx0PDtsPGk8OT47PjtsPHQ8cDxwPGw8QmFja0NvbG9yO0NlbGxQYWRkaW5nO0NlbGxTcGFjaW5nO1dpZHRoO0hlaWdodDtfIVNCOz47bDwyPCcjZjFmMWYxJz47aTwwPjtpPDQ+OzE8MTAwJT47MTw5OCU+O2k8MzkzNjA4Pjs+PjtwPGw8c3R5bGU7PjtsPG1hcmdpbi1sZWZ0OjJweFw7Zm9udC1zaXplOjEycHRcOzs+Pj47Oz47Pj47Pj47PqAzsQb8xsgum1+/yT2r0amk0vPh 
name=__VIEWSTATE>
<SCRIPT language=javascript type=text/javascript>
<!--
	function __doPostBack(eventTarget, eventArgument) {
		var theform;
		if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) {
			theform = document.ratings_tmp;
		}
		else {
			theform = document.forms["ratings_tmp"];
		}
		theform.__EVENTTARGET.value = eventTarget.split("$").join(":");
		theform.__EVENTARGUMENT.value = eventArgument;
		theform.submit();
	}
// -->
</SCRIPT>
 <INPUT id=RatingsServerCmd type=hidden size=1 name=RatingsServerCmd> <INPUT 
class=RatingsData id=RatingsStatus type=hidden size=1 name=RatingsStatus> <INPUT 
id=RatingsContentURL type=hidden size=1 name=RatingsContentURL> <INPUT 
id=RatingsContentTitle type=hidden size=1 name=RatingsContentTitle> 
<TABLE id=tbRatings 
style="FONT-SIZE: 12pt; MARGIN-LEFT: 2px; WIDTH: 100%; HEIGHT: 98%; BACKGROUND-COLOR: #f1f1f1" 
cellSpacing=4 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD colSpan=2>Average rating:<BR><STRONG>8</STRONG> out of 9</TD></TR>
  <TR>
    <TD colSpan=2></TD></TR>
  <TR>
    <TD><IMG height=18 src="ratings_files/rtg_rate.gif" width=18 
      align=absMiddle></TD>
    <TD style="WIDTH: 100%"><A id=Rate title="Rate this page" 
      onclick="return OnRate();" href="javascript:__doPostBack('Rate','')">Rate 
      this page</A></TD></TR>
  <TR>
    <TD><IMG height=18 src="ratings_files/rtg_print.gif" width=18 
      align=absMiddle></TD>
    <TD style="WIDTH: 100%"><A id=Print 
      title="Print a printer-friendly version of this page" 
      onclick="return OnPrint();" 
      href="javascript:__doPostBack('Print','')">Print this page</A></TD></TR>
  <TR>
    <TD><IMG height=18 src="ratings_files/rtg_email.gif" width=18 
      align=absMiddle></TD>
    <TD style="WIDTH: 100%"><A id=Email title="E-mail this page" 
      onclick="return OnEmail();" 
      href="javascript:__doPostBack('Email','')">E-mail this page</A></TD></TR>
  <TR>
    <TD><IMG height=18 src="ratings_files/rtg_save.gif" width=18 
      align=absMiddle></TD>
    <TD style="WIDTH: 100%"><A id=Save title="Add to favorites" 
      onclick="return OnSave();" href="javascript:__doPostBack('Save','')">Add 
      to Favorites</A></TD></TR></TBODY></TABLE></FORM></BODY></HTML>
