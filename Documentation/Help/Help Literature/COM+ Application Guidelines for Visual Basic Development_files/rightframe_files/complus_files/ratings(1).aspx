﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0108)http://msdn.microsoft.com/msdn-online/shared/components/ratings/ratings.aspx?ContentID=_672194&HideDiscuss=1 -->
<HTML><HEAD><TITLE>Page Stats</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content=noindex name=robots>
<META content=build name=168><LINK href="ratings(1)_files/ie4.css" type=text/css 
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
				GetRateID("672194");

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
action=ratings.aspx?ContentID=_672194&amp;HideDiscuss=1 method=post><INPUT 
type=hidden name=__EVENTTARGET> <INPUT type=hidden name=__EVENTARGUMENT> <INPUT 
type=hidden 
value=dDwxMDM3Mjg1ODQ5O3Q8cDxsPEhpZGVEaXNjdXNzO1JhdGVMb3c7Q291bnRUZXh0O1JhdGVDb3VudDtDb3VudEZpcnN0VGV4dDtOb1JhdGluZztGZWVkYmFja1RleHQ7UGFnZVJhdGU7SGlzdG9ncmFtO0JvcmRlckNvbG9yO1BhZ2VSYW5nZTtSYXRlSGlnaDtSYXRlVGhpc1BhZ2U7QmFja0NvbG9yO0F2ZXJhZ2VUZXh0Oz47bDxcZTtQb29yO1w8U1RST05HXD57MDpHfVw8L1NUUk9OR1w+IHBlb3BsZSBoYXZlIHJhdGVkIHRoaXMgcGFnZTtpPDM3ND47XDxTVFJPTkdcPjFcPC9TVFJPTkdcPiBwZXJzb24gaGFzIHJhdGVkIHRoaXMgcGFnZTtcPFNUUk9OR1w+QmUgdGhlIGZpcnN0IHRvIHJhdGUgdGhpcyBwYWdlIVw8L1NUUk9OR1w+O1w8U1RST05HXD5UZWxsIHVzIHdoeSB5b3UgcmF0ZWQgdGhlIGNvbnRlbnQgdGhpcyB3YXkuIChvcHRpb25hbClcPC9TVFJPTkdcPjtTeXN0ZW0uU2luZ2xlLCBtc2NvcmxpYiwgVmVyc2lvbj0xLjAuNTAwMC4wLCBDdWx0dXJlPW5ldXRyYWwsIFB1YmxpY0tleVRva2VuPWI3N2E1YzU2MTkzNGUwODk8OTMuMzE+O2w8aTwyMD47aTwwPjtpPDM+O2k8MD47aTwzPjtpPDE+O2k8MjI+O2k8Nz47aTwzMTg+O2k8MzE4Pjs+OyM5OTk5OTk7aTw5PjtPdXRzdGFuZGluZztcPFNUUk9OR1w+SG93IHdvdWxkIHlvdSByYXRlIHRoZSBxdWFsaXR5IG9mIHRoaXMgY29udGVudD9cPC9TVFJPTkdcPjsjZjFmMWYxO0F2ZXJhZ2UgcmF0aW5nOlw8QlJcPlw8U1RST05HXD57MDpHfVw8L1NUUk9OR1w+IG91dCBvZiB7MTpHfTs+PjtsPGk8MT47PjtsPHQ8O2w8aTw5Pjs+O2w8dDxwPHA8bDxCYWNrQ29sb3I7Q2VsbFBhZGRpbmc7Q2VsbFNwYWNpbmc7V2lkdGg7SGVpZ2h0O18hU0I7PjtsPDI8JyNmMWYxZjEnPjtpPDA+O2k8MD47MTwxMDAlPjsxPDEwMCU+O2k8MzkzNjA4Pjs+Pjs+Ozs+Oz4+Oz4+O2w8UHJpbnRJY29uO0VtYWlsSWNvbjtTYXZlSWNvbjtSYXRlMTtSYXRlMTtSYXRlMjtSYXRlMjtSYXRlMztSYXRlMztSYXRlNDtSYXRlNDtSYXRlNTtSYXRlNTtSYXRlNjtSYXRlNjtSYXRlNztSYXRlNztSYXRlODtSYXRlODtSYXRlOTtSYXRlOTs+PmZnbLALMPSMq9DY71afpVAvqpRQ 
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
style="WIDTH: 100%; BORDER-COLLAPSE: collapse; HEIGHT: 100%; BACKGROUND-COLOR: #f1f1f1" 
cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR style="HEIGHT: 1px" vAlign=top>
    <TD colSpan=2>
      <TABLE 
      style="BORDER-TOP: #999999 1px solid; BORDER-BOTTOM: #999999 1px solid" 
      cellSpacing=2 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD><INPUT id=PrintIcon 
            title="Print a printer-friendly version of this page" 
            style="PADDING-RIGHT: 2px; DISPLAY: inline; MARGIN-LEFT: 8px" 
            onclick="return OnPrint();" type=image 
            alt="Print a printer-friendly version of this page" 
            src="ratings(1)_files/rtg_print.gif" border=0 name=PrintIcon></TD>
          <TD noWrap><A id=Print 
            title="Print a printer-friendly version of this page" 
            style="PADDING-LEFT: 2px; COLOR: #000; MARGIN-RIGHT: 8px" 
            onclick="return OnPrint();" 
            href="javascript:__doPostBack('Print','')">Print</A></TD>
          <TD><INPUT id=EmailIcon title="E-mail this page" 
            style="PADDING-RIGHT: 2px; DISPLAY: inline; MARGIN-LEFT: 8px" 
            onclick="return OnEmail();" type=image alt="E-mail this page" 
            src="ratings(1)_files/rtg_email.gif" border=0 name=EmailIcon></TD>
          <TD noWrap><A id=Email title="E-mail this page" 
            style="PADDING-LEFT: 2px; COLOR: #000; MARGIN-RIGHT: 8px" 
            onclick="return OnEmail();" 
            href="javascript:__doPostBack('Email','')">E-Mail</A></TD>
          <TD><INPUT id=SaveIcon title="Add to favorites" 
            style="PADDING-RIGHT: 2px; DISPLAY: inline; MARGIN-LEFT: 8px" 
            onclick="return OnSave();" type=image alt="Add to favorites" 
            src="ratings(1)_files/rtg_save.gif" border=0 name=SaveIcon></TD>
          <TD noWrap><A id=Save title="Add to favorites" 
            style="PADDING-LEFT: 2px; COLOR: #000; MARGIN-RIGHT: 8px" 
            onclick="return OnSave();" 
            href="javascript:__doPostBack('Save','')">Add to Favorites</A></TD>
          <TD style="WIDTH: 100%"></TD></TR></TBODY></TABLE></TD></TR>
  <TR vAlign=top>
    <TD style="BORDER-RIGHT: #999999 1px dotted; WIDTH: 400px">
      <TABLE style="MARGIN-LEFT: 10px" cellSpacing=4 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD>
            <P><STRONG>How would you rate the quality of this 
            content?</STRONG></P>
            <TABLE style="MARGIN-BOTTOM: 12px; BORDER-COLLAPSE: collapse" 
            cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR align=middle>
                <TD></TD>
                <TD>1</TD>
                <TD>2</TD>
                <TD>3</TD>
                <TD>4</TD>
                <TD>5</TD>
                <TD>6</TD>
                <TD>7</TD>
                <TD>8</TD>
                <TD>9</TD>
                <TD></TD></TR>
              <TR align=middle>
                <TD>Poor&nbsp;</TD>
                <TD><INPUT id=Rate1 type=radio value=Rate1 name=Rate></TD>
                <TD><INPUT id=Rate2 type=radio value=Rate2 name=Rate></TD>
                <TD><INPUT id=Rate3 type=radio value=Rate3 name=Rate></TD>
                <TD><INPUT id=Rate4 type=radio value=Rate4 name=Rate></TD>
                <TD><INPUT id=Rate5 type=radio value=Rate5 name=Rate></TD>
                <TD><INPUT id=Rate6 type=radio value=Rate6 name=Rate></TD>
                <TD><INPUT id=Rate7 type=radio value=Rate7 name=Rate></TD>
                <TD><INPUT id=Rate8 type=radio value=Rate8 name=Rate></TD>
                <TD><INPUT id=Rate9 type=radio value=Rate9 name=Rate></TD>
                <TD>&nbsp;Outstanding</TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD><STRONG>Tell us why you rated the content this way. 
            (optional)</STRONG></TD></TR>
        <TR>
          <TD><TEXTAREA id=txtFeedback name=txtFeedback rows=4 cols=42></TEXTAREA></TD></TR>
        <TR>
          <TD><INPUT id=btnSend type=submit value=Submit name=btnSend></TD></TR></TBODY></TABLE></TD>
    <TD>
      <TABLE style="MARGIN-LEFT: 10px; WIDTH: 190px" cellSpacing=4 cellPadding=0 
      border=0>
        <TBODY>
        <TR>
          <TD colSpan=2>Average rating:<BR><STRONG>8</STRONG> out of 9</TD></TR>
        <TR>
          <TD colSpan=2>
            <TABLE cellSpacing=1 cellPadding=0 border=0>
              <TBODY>
              <TR vAlign=bottom>
                <TD><IMG height=2 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=0 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=0 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=0 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=0 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=0 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=2 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=0 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD>
                <TD><IMG height=40 src="ratings(1)_files/rtg_Bar.gif" width=12 
                  align=bottom></TD></TR>
              <TR>
                <TD align=middle>1</TD>
                <TD align=middle>2</TD>
                <TD align=middle>3</TD>
                <TD align=middle>4</TD>
                <TD align=middle>5</TD>
                <TD align=middle>6</TD>
                <TD align=middle>7</TD>
                <TD align=middle>8</TD>
                <TD align=middle>9</TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD><STRONG>374</STRONG> people have rated this 
      page</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></BODY></HTML>
