<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="content-body">
	  	<div style="display: flex;">
		    <button onclick="a()" class="btn" style="margin-left: auto;">인쇄</button>
		</div> 	
  		<div class ="paper" id="print">
		<table width="680"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:" align="center" >
		  <tr>
		    <td width="99%" height="100" align="center" class="f18b"><div   id="ti1" style="padding:3px;" onClick="pycode(1)">발 주 서</div></td>
		    <td width="1%" align="right" id="tms_auto_sign">&nbsp;</td>
		  </tr>
		</table>
		<table width="680"  border="1"  cellspacing="0" cellpadding="0" bordercolor="#000000" style="border-collapse:collapse;table-layout:" align="center">
		  <tr>
		    <td height="30" align="center">
		    <table width="680"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:" align="center" class="f10">
		      <tr>
		        <td width="10%" height="25" align="center" bgcolor="#E2EFDA" style="font-weight: bold">회사명</td>
		        <td width="2%" align="center" bgcolor="#E2EFDA" style="font-weight: bold">:</td>
		        <td width="38%" bgcolor="#E2EFDA" style="font-weight: bold"><div   id="is1" style="padding:3px;">(주)삼김신조유</div></td>
		        <td width="10%" align="center" bgcolor="#E2EFDA">발주번호</td>
		        <td width="2%" align="center" bgcolor="#E2EFDA">:</td>
		        <td width="38%" bgcolor="#E2EFDA"><div tms_edit  id="docno" style="padding:3px;">${paVO.codeVo.code_name}</div></td>
		      </tr>
		      <tr>
		        <td height="25" align="center" bgcolor="#E2EFDA">Phone</td>
		        <td align="center" bgcolor="#E2EFDA">:</td>
		        <td bgcolor="#E2EFDA"><div   id="is2" style="padding:3px;">031-253-5225</div></td>
		        <td align="center" bgcolor="#E2EFDA">F A X</td>
		        <td align="center" bgcolor="#E2EFDA">:</td>
		        <td bgcolor="#E2EFDA"><div   id="user_info" style="padding:3px;">031-253-9900</div></td>
		        </tr>
		      <tr>
		        <td height="25" align="center" bgcolor="#E2EFDA">발 주 자</td>
		        <td align="center" bgcolor="#E2EFDA">:</td>
		        <td bgcolor="#E2EFDA"><div   id="is3" style="padding:3px;">${paVO.userVO.user_name }</div></td>
		        <td align="center" bgcolor="#E2EFDA">작성일자</td>
		        <td align="center" bgcolor="#E2EFDA">:</td>
		        <td bgcolor="#E2EFDA"><div class="inputBox" id="w_date6" style="padding:2px;cursor:hand;" ><fmt:formatDate value="${paVO.pa_issueDate}" pattern="yyyy-MM-dd" /></div></td>
		        </tr>
	          <tr>
		        <td height="25" align="center" bgcolor="#E2EFDA">Phone</td>
		        <td align="center" bgcolor="#E2EFDA">:</td>
		        <td bgcolor="#E2EFDA"><div   id="is2" style="padding:3px;">${paVO.userVO.user_number}</div></td>
		        <td align="center" bgcolor="#E2EFDA">e-mail</td>
		        <td align="center" bgcolor="#E2EFDA">:</td>
		        <td bgcolor="#E2EFDA"><div   id="user_info" style="padding:3px;">${paVO.userVO.user_email}</div></td>
		        </tr>
		    </table>
		    </td>
		  </tr>
		</table>
		<table width="680"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:fixed" align="center" class="f10">
		  <tr>
		    <td height="5" align="right" ></td>
		  </tr>
		</table>
		<table width="680"  border="1"  cellspacing="0" cellpadding="0" bordercolor="#000000" style="border-collapse:collapse;table-layout:" align="center" class="f10">
		  <tr>
		    <td width="162" height="25" align="center" style="font-weight: bold" >공급업체명</td>
		    <td width="162" height="25" align="center" style="font-weight: bold" >등록번호</td>
		    <td width="162" align="center" style="font-weight: bold" >대표</td>
		    <td width="163" align="center" style="font-weight: bold" >Phone</td>
		    <td width="163" align="center" style="font-weight: bold" >e-mail</td>
		    <td width="163" align="center" style="font-weight: bold" >FAX</td>
		  </tr>
		  <tr>
		    <td height="25" align="center" ><div tms_edit id="cn1" style="font-size: 14px;">${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_companyname}</div></td>
		    <td align="center" ><div tms_edit id="cn2" style="font-size: 14px;">${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_taxid}</div></td>
		    <td align="center" ><div tms_edit id="cn3" style="font-size: 14px;">${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_ownername}</div></td>
		    <td align="center" ><div tms_edit id="cn4" style="font-size: 14px;">${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_number}</div></td>
		    <td align="center" ><div tms_edit id="cn5" style="font-size: 14px;">${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_email}</div></td>
		    <td align="center" ><div tms_edit id="cn6" style="font-size: 14px;">${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_fax}</div></td>
		  </tr>
		</table>
		<table width="680"  border="0"  cellspacing="0" cellpadding="0" bordercolor="#ffffff" style="border-collapse:collapse;table-layout:fixed" align="center" class="f10">
		  <tr>
		    <td height="5" align="right" ></td>
		  </tr>
		</table>
		<table width="680"  border="1"  cellspacing="0" cellpadding="0" bordercolor="#000000" style="border-collapse:collapse;table-layout:fixed" align="center" class="f9">
		  <tr>
		    <td width="30" height="40" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >NO</td>
		    <td width="90" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >품 명</td>
		    <td width="90" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >원산지</td>
		    <td width="100" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >규격 및 사양</td>
		    <td width="40" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >수량</td>
		    <td width="40" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >단위</td>
		    <td width="70" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >단 가</td>
		    <td width="90" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >금액(VAT별도)</td>
		    <td width="90" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >합계</td>
		  </tr>
		<tr>
		  <td height="30" align="center" >1</td>
		  <td align="center" ><div  tms_edit id="aa1" style="padding:3px; font-size: 14px;" >${paVO.obtainVo.materialVO.ma_name}</div></td>
		  <td align="center" ><div  tms_edit id="aa1" style="padding:3px; font-size: 14px;" >${paVO.obtainVo.materialVO.ma_origin}</div></td>
		  <td align="center" ><div  tms_edit id="bb1" style="padding:3px; font-size: 14px;">${paVO.obtainVo.materialVO.ma_specifications}</div></td>
		  <td align="right" ><div  tms_edit id="ee1" onBlur="calc_value1(this, 'dd', 'ff')" style="padding:3px; font-size: 14px;">${paVO.obtainVo.obtain_quantity}</div></td>
		  <td align="center" ><div  tms_edit id="cc1" style="padding:3px; font-size: 14px;" >${paVO.obtainVo.materialVO.ma_unit}</div></td>
		  <td align="right" ><div  tms_edit id="dd1" onBlur="calc_value1(this, 'ee', 'ff')" style="padding:3px; font-size: 14px;"><fmt:formatNumber value="${paVO.obtainVo.materialVO.ma_price}" pattern="###,###,###,###" />원</div></td>
		  <td align="right" ><div  id="ff1" style="padding:3px; font-size: 14px;" ><fmt:formatNumber value="${paVO.obtainVo.materialVO.ma_price}" pattern="###,###,###,###" />원</div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff1" style="padding:3px; font-size: 14px;" ><fmt:formatNumber value="${paVO.obtainVo.materialVO.ma_price * paVO.obtainVo.obtain_quantity}" pattern="###,###,###,###" />원</div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >2</td>
		  <td align="center" ><div  tms_edit id="aa2" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb2" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb2" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee2" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc2" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd2" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd2" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff2" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >3</td>
		  <td align="center" ><div  tms_edit id="aa3" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb3" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb3" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee3" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc3" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd3" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd3" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff3" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >4</td>
		  <td align="center" ><div  tms_edit id="aa4" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb4" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb4" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee4" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc4" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd4" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd4" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff4" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >5</td>
		  <td align="center" ><div  tms_edit id="aa5" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb5" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb5" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee5" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc5" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd5" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd5" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff5" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >6</td>
		  <td align="center" ><div  tms_edit id="aa6" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb6" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb6" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee6" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc6" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd6" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd6" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff6" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >7</td>
		  <td align="center" ><div  tms_edit id="aa7" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb7" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb7" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee7" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc7" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd7" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd7" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff7" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >8</td>
		  <td align="center" ><div  tms_edit id="aa8" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb8" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb8" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee8" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc8" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd8" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd8" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff8" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >9</td>
		  <td align="center" ><div  tms_edit id="aa9" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb9" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb9" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee9" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc9" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd9" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd9" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff9" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >10</td>
		  <td align="center" ><div  tms_edit id="aa10" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb10" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb10" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee10" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc10" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd10" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd10" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff10" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >11</td>
		  <td align="center" ><div  tms_edit id="aa11" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb11" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb11" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee11" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc11" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd11" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd11" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff11" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >12</td>
		  <td align="center" ><div  tms_edit id="aa12" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb12" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb12" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee12" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc12" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd12" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd12" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff12" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >13</td>
		  <td align="center" ><div  tms_edit id="aa13" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb13" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb13" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee13" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc13" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd13" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd13" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff13" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >14</td>
		  <td align="center" ><div  tms_edit id="aa14" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb14" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb14" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee14" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc14" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd14" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd14" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff14" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" align="center" >15</td>
		  <td align="center" ><div  tms_edit id="aa15" style="padding:3px;" onDblClick="javascript:pum_code(this);"></div></td>
		  <td align="center" ><div  tms_edit id="bb15" style="padding:3px;" ></div></td>
		  <td align="center" ><div  tms_edit id="bb15" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="ee15" onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="center" ><div  tms_edit id="cc15" style="padding:3px;" ></div></td>
		  <td align="right" ><div  tms_edit id="dd15" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" ><div  tms_edit id="dd15" onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)" style="padding:3px;"></div></td>
		  <td align="right" bgcolor="#F8F8F8" ><div  id="ff15" style="padding:3px;" ></div></td>
		  </tr>
		<tr>
		  <td height="30" colspan="6" align="center" bgcolor="#E2EFDA" style="font-weight: bold" >총 합 계</td>
		  <td align="right" bgcolor="#F8F8F8" style="font-weight: bold" colspan="3" ><div  id="sum_ff" style="padding:3px;"><fmt:formatNumber value="${paVO.obtainVo.materialVO.ma_price * paVO.obtainVo.obtain_quantity}" pattern="###,###,###,###" />원</div></td>
		 
		</tr>
		  <tr>
		    <td height="30" colspan="9" align="left" style="font-weight: bold" ><div  tms_edit id="gg31" style="padding:3px;line-height:25px" >1. 납품주소 : <br/>
		    경기 수원시 팔달구 덕영대로 899 세진브론즈빌 3층 MBC아카데미컴퓨터교육센터수원<br>
		      2. 납 기 일 : ${paVO.obtainVo.obtain_deliveryDate}<br>
		      3. 비고: ${paVO.pa_notes} <br>
		      <span style="color: #0033FF">전자세금계산서 발행용 메일주소 goodjob@goodapp.co.kr</span></div></td>
		  </tr>
		</table>
  		</div>
	

    </div>
    
    <!-- Required vendors -->
    <script src="${contextPath}/resources/vendor/global/global.min.js"></script>
    <script src="${contextPath}/resources/js/quixnav-init.js"></script>
    <script src="${contextPath}/resources/js/custom.min.js"></script>

    <script src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>
    <!-- Circle progress -->

</body>

<script type="text/javascript">
function a() {
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function(){
	    document.body.innerHTML = document.getElementById("print").innerHTML;
	}
	window.onafterprint = function(){
	    document.body.innerHTML = initBody;
	}
	window.print();
	}
</script>
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
	text-decoration: none;a
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
    .paper {
        margin: 0;
        border: initial;
        border-radius: initial;
        width: initial;
        min-height: initial;
        box-shadow: initial;
        background: initial;
        page-break-after: always;
    }
   


</style>
</body>
</html>