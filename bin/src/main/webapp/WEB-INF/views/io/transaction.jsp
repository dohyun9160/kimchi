<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, minimum-scale=0.5, user-scalable=yes">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<TITLE>거래명세서</TITLE>
<link href="./common.css" rel="stylesheet" type="text/css">
<script language="javascript" src="./common.js"></script>
 <%
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        String formattedDate = sdf.format(now);
    %>
    
    
<style type="text/css">


p{
 margin:0px;
}

.f8 {	font-family: "굴림";	font-size: 8pt;	color: #000000;	text-decoration: none;	letter-spacing:0px; }
.f8b {	font-family: "굴림";	font-size: 8pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f9 {	font-family: "굴림";	font-size: 9pt;	color: #000000;	text-decoration: none;	letter-spacing:0px; }
.f9b {	font-family: "굴림";	font-size: 9pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f10 {	font-family: "굴림";	font-size: 10pt;	color: #000000;	text-decoration: none;	letter-spacing:0px; }
.f10b {	font-family: "굴림";	font-size: 10pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f11 {	font-family: "굴림";	font-size: 11pt;	color: #000000;	text-decoration: none;	letter-spacing:0px; }
.f11b {	font-family: "굴림";	font-size: 11pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f13 {	font-family: "굴림";	font-size: 13pt;	color: #000000;	text-decoration: none;	letter-spacing:0px; }
.f13b {	font-family: "굴림";	font-size: 13pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f14b {	font-family: "굴림";	font-size: 14pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f14 {	font-family: "굴림";	    font-size: 14pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	}
.f16b {	font-family: "굴림";	    font-size: 16pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f18b {	font-family: "굴림";	    font-size: 18pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}
.f20b {	font-family: "굴림";	    font-size: 20pt;	color: #000000;	text-decoration: none;	letter-spacing:0px;	font-weight:bold;}

.fieldside_bottom {
		font-family:  "굴림","돋움", seoul;
	font-size: 12px;
	color: #ffffff;
	text-decoration: none;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #ffffff;
	border-right-color: #ffffff;
	border-bottom-color: #000000;
	border-left-color: #ffffff;
}

.paper {
    width: 210mm;
    min-height: 297mm;
    padding: 20mm; /* set contents area */
    margin: 10mm auto;
    border-radius: 5px;
    background: white;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

@page {
    size: A4;
    margin: 0;
}
@media print {
            body * {
                visibility: hidden;
            }
            #print, #print * {
                visibility: visible;
            }
            #print {
                position: absolute;
                left: 0;
                top: 0;
            }
        }
   



</style>

</HEAD>
<BODY >
<div class="content-body">
	  	<button onclick="p()" class="btn">인쇄</button> 	
	  	
	<div class="paper" id="print">
<table width="650"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:" align="center" >
  <tr>
    <td width="99%" height="100" align="center" class="f18b"><div   id="ti1" style="padding:3px;" onClick="pycode(1)">거래명세서</div></td>
    <td width="1%" align="right" id="tms_auto_sign">&nbsp;</td>
  </tr>
  
</table>

<table width="650"  border="1"  cellspacing="0" cellpadding="0" bordercolor="#000000" style="border-collapse:collapse;table-layout:" align="center">
  <tr>
    <td height="30" align="center">
    <table width="650"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:" align="center" class="f10">
      <tr>
        <td width="10%" height="25" align="center" bgcolor="#E2EFDA" style="font-weight: bold">공급업체</td>
        <td width="2%" align="center" bgcolor="#E2EFDA" style="font-weight: bold">:</td>
        <td width="38%" bgcolor="#E2EFDA" style="font-weight: bold"><div   id="is1" style="padding:3px;">${value.partner_companyname}</div></td>
        <td width="10%" align="center" bgcolor="#E2EFDA">관리번호</td><!--현재 날짜 추가  -->
        <td width="2%" align="center" bgcolor="#E2EFDA">:</td>
        <td width="38%" bgcolor="#E2EFDA"><div tms_edit  id="docno" style="padding:3px;"> io-${value.obtain_no}</div></td>
      </tr>
      <tr>
        <td height="25" align="center" bgcolor="#E2EFDA">Phone</td>
        <td align="center" bgcolor="#E2EFDA">:</td>
        <td bgcolor="#E2EFDA"><div   id="is2" style="padding:3px;">${value.partner_number}</div></td>
        <td align="center" bgcolor="#E2EFDA">담 당 자</td>
        <td align="center" bgcolor="#E2EFDA">:</td>
        <td bgcolor="#E2EFDA"><div   id="user_info" style="padding:3px;">${value.partner_ownername}</div></td>
        </tr>
      <tr>
        <td height="25" align="center" bgcolor="#E2EFDA">F A X</td>
        <td align="center" bgcolor="#E2EFDA">:</td>
        <td bgcolor="#E2EFDA"><div   id="is3" style="padding:3px;">${value.partner_fax }</div></td>
        <td align="center" bgcolor="#E2EFDA">주소</td>
        <td align="center" bgcolor="#E2EFDA">:</td>
        <td bgcolor="#E2EFDA"><div class="inputBox" id="w_date6" style="padding:2px;cursor:hand;" >${value.partner_add}</div></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="650"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:fixed" align="center" class="f10">
  <tr>
    <td height="5" align="right" ></td>
  </tr>
</table>
<table width="650"  border="1"  cellspacing="0" cellpadding="0" bordercolor="#000000" style="border-collapse:collapse;table-layout:" align="center" class="f10">
  <tr>
    <td width="162" height="25" align="center" style="font-weight: bold" >회사명</td>
    <td width="162" align="center" style="font-weight: bold" >직위</td>
    <td width="162" align="center" style="font-weight: bold" >담당자</td>
    <td width="163" align="center" style="font-weight: bold" >Phone</td>
    <td width="163" align="center" style="font-weight: bold" >FAX</td>
  </tr>
  <tr>
    <td height="25" align="center" ><div tms_edit id="cn1" onKeyDown="javascript:enterkey_process();">(주)삼김신조유</div></td>
    <td align="center" ><div tms_edit id="cn2" ></div>자재(입고)part</td>
    <td align="center" ><div tms_edit id="cn3" ></div>조재현</td>
    <td align="center" ><div tms_edit id="cn4" ></div>010.1111.2222</td>
    <td align="center" ><div tms_edit id="cn5" ></div>070.1234.4567</td>
  </tr>
</table>
<table width="650"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:fixed" align="center" class="f10">
  <tr>
    <td height="5" align="right" ></td>
  </tr>
</table>
<table width="650"  border="1"  cellspacing="0" cellpadding="0" bordercolor="#000000" style="border-collapse:collapse;table-layout:fixed" align="center" class="f9">
  <tr>
    <td width="32" height="40" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >NO</td>
    <td width="124" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >품 명</td>
    <td width="104" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >규격 및 사양</td>
    <td width="43" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >수량</td>
    <td width="41" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >단위</td>
    <td width="61" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >단 가</td>
    <td width="107" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >금액(VAT별도)</td>
    <td width="62" align="center" bgcolor="#E2EFDA" style="font-weight: bold" colspan="2">비고</td>
  </tr>
<tr>
  <td height="30" align="center" >1</td>
  <td align="center" ><div  tms_edit id="aa1" style="padding:3px;" onDblClick="javascript:pum_code(this);">${value.ma_name }</div></td>
  <td align="center" ><div  tms_edit id="bb1" style="padding:3px;" ></div>${value.ma_specifications}(${value.ma_weight }${value.ma_unit})</td>
  <td align="right" ><div  tms_edit id="ee1" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;">${value.obtain_quantity }</div></td>
  <td align="center" ><div  tms_edit id="cc1" style="padding:3px;" >${value.ma_unit}</div></td>
  <td align="right" ><div  tms_edit id="dd1" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"><fmt:formatNumber value="${value.ma_price }" type="number" pattern="###,###,###,###"/>원</div></td>
  <td align="center" ><div  tms_edit id="gg1" style="padding:3px;" ></div></td>
  <td align="center" colspan="2" ><div  tms_edit id="gg16" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >2</td>
  <td align="center" ><div  tms_edit id="aa2" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb2" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee2" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc2" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd2" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg2" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg17" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >3</td>
  <td align="center" ><div  tms_edit id="aa3" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb3" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee3" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc3" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd3" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg3" style="padding:3px;" ></div></td>
  <td align="center" colspan="2" ><div  tms_edit id="gg18" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >4</td>
  <td align="center" ><div  tms_edit id="aa4" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb4" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee4" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc4" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd4" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg4" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg19" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >5</td>
  <td align="center" ><div  tms_edit id="aa5" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb5" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee5" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc5" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd5" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg5" style="padding:3px;" ></div></td>
  <td align="center" colspan="2" ><div  tms_edit id="gg20" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >6</td>
  <td align="center" ><div  tms_edit id="aa6" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb6" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee6" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc6" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd6" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg6" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg21" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >7</td>
  <td align="center" ><div  tms_edit id="aa7" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb7" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee7" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc7" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd7" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg7" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg22" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >8</td>
  <td align="center" ><div  tms_edit id="aa8" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb8" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee8" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc8" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd8" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg8" style="padding:3px;" ></div></td>
  <td align="center" colspan="2" ><div  tms_edit id="gg23" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >9</td>
  <td align="center" ><div  tms_edit id="aa9" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb9" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee9" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc9" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd9" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg9" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg24" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >10</td>
  <td align="center" ><div  tms_edit id="aa10" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb10" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee10" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc10" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd10" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg10" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg25" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >11</td>
  <td align="center" ><div  tms_edit id="aa11" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb11" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee11" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc11" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd11" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg11" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg26" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >12</td>
  <td align="center" ><div  tms_edit id="aa12" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb12" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee12" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc12" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd12" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg12" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg27" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >13</td>
  <td align="center" ><div  tms_edit id="aa13" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb13" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee13" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc13" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd13" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg13" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg28" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >14</td>
  <td align="center" ><div  tms_edit id="aa14" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb14" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee14" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc14" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd14" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg14" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg29" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" align="center" >15</td>
  <td align="center" ><div  tms_edit id="aa15" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
  <td align="center" ><div  tms_edit id="bb15" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="ee15" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="cc15" style="padding:3px;" ></div></td>
  <td align="right" ><div  tms_edit id="dd15" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
  <td align="center" ><div  tms_edit id="gg15" style="padding:3px;" ></div></td>
  <td align="center" colspan="2"><div  tms_edit id="gg30" style="padding:3px;" ></div></td>
  </tr>
<tr>
  <td height="30" colspan="6" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >총  금  액</td>
  <td align="right" bgcolor="#F8F8F8" style="font-weight: bold" ><div  id="sum_ff" style="padding:3px;"></div></td>
  <td align="right" style="font-weight: bold" colspan="2"><fmt:formatNumber value="${value.ma_price*value.obtain_quantity}" type="number" pattern="###,###,###,###"/>원</td>
</tr>
  <tr>
  	<fmt:parseDate var="parsedDate" value="${value.obtain_deliveryDate}" pattern="yyyy-MM-dd"/>
    <td height="30" colspan="9" align="left" style="font-weight: bold" ><div  tms_edit id="gg31" style="padding:3px;line-height:25px" >1. 납품주소 : 경기 수원시 팔달구 덕영대로 899 세진브론즈빌 지하 ${value.ma_storage} <br>
      2. 납 기 일 : <fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일"/><br>
      3. 금 액 : <fmt:formatNumber value="${value.ma_price*value.obtain_quantity}" type="number" pattern="###,###,###,###"/>원 <br>
      <span style="color: #0033FF">문의사항) 메일주소 mbcacademy@kimchi.co.kr</span></div></td>
  </tr>
  
</table>
<table width="650"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:fixed" align="center" class="f10">
  <tr>
    <td height="25" align="right" >&nbsp;</td>
  </tr>
</table>
<p>&nbsp;</p>
</div>
</div>

<script type="text/javascript">
function p() {
    window.print();
}

</script>

</BODY>
</HTML>
