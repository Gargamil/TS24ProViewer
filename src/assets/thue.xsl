<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="GTGT_01_TT26.xml" -->
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<!--
  Mã tờ khai: 01
  VersionXML: 2.1.2
  Loại tờ khai: Q, M
  Hiệu lực kỳ kê khai: 2013
  Ngày áp dụng: 20130101
  Thông tư: TT26/2015/TT-BTC
  Người chỉnh sửa: Nguyễn Thái Hòa
  Ngày chỉnh sửa: 20190426
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

  <xsl:decimal-format name="vndong" decimal-separator=',' grouping-separator='.' />
  <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyzàáảãạăằắẳẵặâầấẩẫậđèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ</xsl:variable>
  <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁẢÃẠĂẰẮẲẴẶÂẦẤẨẪẬĐÈÉẺẼẸÊỀẾỂỄỆÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴ</xsl:variable> 

  <xsl:template match="HSoThueDTu">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>GTGT_01_TT26_2015</title>
        
		<!-- CSS -->
		<style type="text/css">
          table { width:100%; table-layout:auto empty-cells:show; border: 0; font-size:14px; font-family:"Times New Roman", Times, serif; border-collapse:collapse; table-layout:fixed; position:relative; }
          .pagePortrait { width:700px; }
          .pageLandscape {
			  width:1000px;
		  }
          .pagebreak { page-break-after: always; }
          .cell, .half-cell { border: 1px solid #000; display:inline-block; *display:inline; zoom:1; padding: 0px; }
          .cellformat{ width:20px; height:20px; line-height:20px; text-align:center; vertical-align:middle; }
          .cellformatdetail { width:15px; height:15px; line-height:15px; text-align:center; vertical-align:middle; }
		  .cellformatheight { height:14px; line-height:14px; text-align:center; }
          .borderTD_note { border:1px solid #000; border-collapse:collapse; vertical-align:middle; word-break:break-all; }
          .borderTD { border:1px solid #000; border-collapse:collapse; vertical-align:middle; }
          .borderLeftRight { border:1px solid #000; border-collapse:collapse; vertical-align:middle; border-bottom:none; border-top:none; }
          .borderTopBottom { border:1px solid #000; border-collapse:collapse; vertical-align:middle; border-right:none; border-left:none; }
          .borderTop { border-top:1px solid #000; border-collapse:collapse; vertical-align:middle; }
          .borderBottom { border-bottom:1px solid #000; border-collapse:collapse; vertical-align:middle; }
          .borderLeft { border-left:1px solid #000; border-collapse:collapse; vertical-align:middle; }
          .borderRight { border-right:1px solid #000; border-collapse:collapse; vertical-align:middle; }
		  @media (max-width: 700px) {
			@page {
			  size: A4;
			}
		  }
		  @media print and (width: 21cm) and (height: 29.7cm) {               
			@page port {
				size: A4 portrait !important;
			}
			.portrait { page: port; }
	  
			@page land { size: A4 landscape !important; }
			.landscape { page: land; }                
	  
			.break { page-break-before: always; }
		  }  
        </style>
      </head>
      
      <body>
        <!-- TỜ KHAI CHÍNH -->
        <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          <!-- Thông tin Mẫu số tờ khai chính và Mã vạch -->
          <xsl:copy-of select="$MauSoToKhaiChinhvaMaVach"/>

          <!-- Thông tin tên tờ khai -->
          <xsl:copy-of select="$TenTKhaiChinh"/>

          <!-- Thông tin kỳ kê khai -->
          <xsl:copy-of select="$KyKeKhai"/>

          <!-- Đưa vào Thông tin loại tờ khai -->
          <xsl:copy-of select="$LoaiTKhai"/>

          <!-- Đưa vào Thông tin NNT -->
          <xsl:copy-of select="$NNT"/>

          <!-- Thông tin ĐLT -->
          <xsl:copy-of select="$DLT"/>

          <!-- Thông tin Chi tiết tờ khai chính -->
          <xsl:copy-of select="$TTChiTietTKhaiChinh"/>

          <!-- Thông tin Cam kết -->
          <xsl:copy-of select="$CamKet"/>
          <br />

          <!-- Thông tin NV ĐLT và CKS -->
          <xsl:copy-of select="$CKS"/>

          <!-- Thông tin Ghi chú -->
          <xsl:copy-of select="$GhiChu"/>

          <!-- Hỗ trợ hoạch toán phụ thuộc -->
          <xsl:copy-of select="$HoachToanPhuThuoc"/>
        </td></tr></table>
      </body>
    </html>
  </xsl:template>

  <!-- Đưa vào Thông tin Mẫu số tờ khai chính và Mã vạch -->
  <xsl:variable name="MauSoToKhaiChinhvaMaVach">
    <table style="table-layout:auto">
      <xsl:choose>
        <xsl:when test="((/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh/MaVach/chiTiet) and count(/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh/MaVach/chiTiet) &gt; 1)">
        <tr>
          <td colspan="3" width="100%" align="right" valign="top">
            <xsl:for-each select="/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh/MaVach/chiTiet">
              <span style="margin:0px 10px">
              <img src='data:image/png;base64,{.}' />
              </span>
            </xsl:for-each>
          </td>
        </tr>
        <tr>
          <td width="25%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
            <div style="border:1px solid #000; padding:3px;">
            Mẫu số: <b>01/GTGT</b><br />
            <i>(Ban hành kèm theo Thông tư<br />
            số 26/2015/TT-BTC ngày<br />
            27/2/2015 của Bộ Tài chính)</i>
            </div>
          </td>
          <td align="center" valign="middle">
            <b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
            <i>Độc lập - Tự do - Hạnh phúc</i><br/>
            -------------------------
          </td>
          <td width="25%">&nbsp;</td>
        </tr>
        </xsl:when>
        <xsl:when test="((/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh/MaVach/chiTiet) and count(/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh/MaVach/chiTiet) = 1)">
        <tr>
          <td width="25%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
            <div style="border:1px solid #000; padding:3px;">
            Mẫu số: <b>01/GTGT</b><br />
            <i>(Ban hành kèm theo Thông tư<br />
            số 26/2015/TT-BTC ngày<br />
            27/2/2015 của Bộ Tài chính)</i>
            </div>
          </td>
          <td align="center" valign="middle">
            <b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
            <i>Độc lập - Tự do - Hạnh phúc</i><br/>
            -------------------------
          </td>
          <td width="25%" align="center" valign="top" style="white-space:nowrap">
            <img src='data:image/png;base64,{/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh/MaVach/chiTiet}' />
          </td>
        </tr>
        </xsl:when>
        <xsl:otherwise>
        <tr>
          <td width="25%">&nbsp;</td>
          <td align="center" valign="middle">
            <b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
            <i>Độc lập - Tự do - Hạnh phúc</i><br/>
            -------------------------
          </td>
          <td width="25%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
            <div style="border:1px solid #000; padding:3px;">
            Mẫu số: <b>01/GTGT</b><br />
            <i>(Ban hành kèm theo Thông tư<br />
            số 26/2015/TT-BTC ngày<br />
            27/2/2015 của Bộ Tài chính)</i>
            </div>
          </td>
        </tr>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin tên tờ khai -->
  <xsl:variable name="TenTKhaiChinh">
    <table>
      <col width="100%" />
      <tr>
        <td align="center" valign="middle">
          <span style="font-size:18px"><b>TỜ KHAI THUẾ GIÁ TRỊ GIA TĂNG</b></span>
          <br />
          <i>(Dành cho người nộp thuế khai thuế giá trị gia tăng theo phương pháp khấu trừ)</i>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin kỳ kê khai -->
  <xsl:variable name="KyKeKhai">
    <table>
      <col width="100%" />
      <tr>
        <td align="center" valign="middle">
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy='Q')"><b>[01]</b> Kỳ tính thuế: Quý <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,1,1)"/> năm <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,3,4)"/></xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy='M')"><b>[01]</b> Kỳ tính thuế: Tháng <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,1,2)"/> năm <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,4,4)"/></xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy='Y')"><b>[01]</b> Kỳ tính thuế: Năm <xsl:value-of select="HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai"/></xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy='D')"><b>[01]</b> Kỳ tính thuế: Lần phát sinh: Ngày <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,1,2)"/> tháng <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,4,2)"/> năm <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,7,4)"/></xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy='K')"><b>[01]</b> Kỳ tính thuế: Kỳ <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,2,1)"/> năm <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai,4,4)"/></xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin loại tờ khai -->
  <xsl:variable name="LoaiTKhai">
    <table>
      <col width="100%" />
      <tr>
        <td align="center" valign="middle">
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/loaiTKhai) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/loaiTKhai='C')">
              <b>[02]</b> Lần đầu [ X ]
              <span style="margin-left:30px">&nbsp;</span>
              <b>[03]</b> Bổ sung lần thứ   [
              <span style="margin-left:6px">&nbsp;</span>
              ]
            </xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/loaiTKhai) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/loaiTKhai='B')">
              <b>[02]</b> Lần đầu [
              <span style="margin-left:6px">&nbsp;</span>
              ]
              <span style="margin-left:30px">&nbsp;</span>
              <b>[03]</b> Bổ sung lần thứ   [
              <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/soLan"/>
              ]
            </xsl:when>
            <xsl:otherwise>
              <b>[02]</b> Lần đầu [
              <span style="margin-left:6px">&nbsp;</span>
              ]
              <span style="margin-left:30px">&nbsp;</span>
              <b>[03]</b> Bổ sung lần thứ   [
              <span style="margin-left:6px">&nbsp;</span>
              ]
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin NNT -->
  <xsl:variable name="NNT">
    <table>
      <col width="30%" />
      <col width="15%" />
      <col width="10%" />
      <col width="45%" />
      <tr><td colspan="4">&nbsp;</td></tr>
      <tr>
        <td colspan="4" align="left" valign="top">
          <b>[04] Tên người nộp thuế: <xsl:value-of select="translate(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenNNT,$lower,$upper)"/></b>
        </td>
      </tr>
      <tr>
        <td colspan="4" align="left" valign="middle">
          <b>[05]</b> Mã số thuế: 
          <span style="margin-left:50px;">&nbsp;</span>
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst)=10)">
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
            </xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst)=13)">
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,11,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,12,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,13,1)"/></span>
            </xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst)=14)">
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,12,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,13,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,14,1)"/></span>
            </xsl:when>
            <xsl:otherwise>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin:0 3px">&nbsp;</span>
              -
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td colspan="4" align="left" valign="top">
          <b>[06]</b> Địa chỉ: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/dchiNNT"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="left" valign="top">
          <b>[07]</b> Quận/Huyện: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenHuyenNNT"/>
        </td>
        <td colspan="2" align="left" valign="top">
          <b>[08]</b> Tỉnh/Thành phố: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenTinhNNT"/>
        </td>
      </tr>
      <tr>
        <td align="left" valign="top">
          <b>[09]</b> Điện thoại: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/dthoaiNNT"/>
        </td>
        <td colspan="2" align="left" valign="top">
          <b>[10]</b> Fax: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/faxNNT"/>
        </td>
        <td align="left" valign="top">
          <b>[11]</b> Email: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/emailNNT"/>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin ĐLT -->
  <xsl:variable name="DLT">
    <table>
      <col width="30%" />
      <col width="15%" />
      <col width="10%" />
      <col width="45%" />
      <tr><td colspan="4">&nbsp;</td></tr>
      <tr>
        <td colspan="4" align="left" valign="top">
          <b>[12] Tên đại lý thuế (nếu có): <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/tenDLyThue"/></b>
        </td>
      </tr>
      <tr>
        <td colspan="4" align="left" valign="middle">
          <b>[13]</b> Mã số thuế: 
          <span style="margin-left:50px;">&nbsp;</span>
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue)=10)">
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
            </xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue)=13)">
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,11,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,12,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,13,1)"/></span>
            </xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue)=14)">
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,12,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,13,1)"/></span>
              <span class="cell cellformat" style="margin-left:3px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/mstDLyThue,14,1)"/></span>
            </xsl:when>
            <xsl:otherwise>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin:0 3px">&nbsp;</span>
              -
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:3px">&nbsp;</span>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td colspan="4" align="left" valign="top">
          <b>[14]</b> Địa chỉ: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/dchiDLyThue"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="left" valign="top">
          <b>[15]</b> Quận/Huyện: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/tenHuyenDLyThue"/>
        </td>
        <td colspan="2" align="left" valign="top">
          <b>[16]</b> Tỉnh/Thành phố: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/tenTinhDLyThue"/>
        </td>
      </tr>
      <tr>
        <td align="left" valign="top">
          <b>[17]</b> Điện thoại: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/dthoaiDLyThue"/>
        </td>
        <td colspan="2" align="left" valign="top">
          <b>[18]</b> Fax: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/faxDLyThue"/>
        </td>
        <td align="left" valign="top">
          <b>[19]</b> Email: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/emailDLyThue"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="left" valign="top">
          <b>[20]</b> Hợp đồng đại lý thuế: Số: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/soHDongDLyThue"/>
        </td>
        <td colspan="2" align="left" valign="top">
          Ngày: 
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/ngayKyHDDLyThue) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/ngayKyHDDLyThue!='')"><xsl:value-of select="concat(substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/ngayKyHDDLyThue,9,2),'/',substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/ngayKyHDDLyThue,6,2),'/',substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/ngayKyHDDLyThue,1,4))"/></xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <!-- Thông tin Đơn vị tiền -->
      <tr>
        <td colspan="4" align="right" valign="bottom">
          <i>Đơn vị tiền: Đồng Việt Nam</i>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin Chi tiết tờ khai chính -->
  <xsl:variable name="TTChiTietTKhaiChinh">
    <xsl:for-each select="/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh[1]">
    <table cellpadding="2" cellspacing="0" style="font-size: 12px;">
      <col width="4%"/>
      <col width="56%"/>
      <col width="5%"/>
      <col width="15%"/>
      <col width="5%"/>
      <col width="15%"/>
      <tr>
        <td align="center" class="borderTD"><b>STT</b></td>
        <td align="center" class="borderTD"><b>Chỉ tiêu</b></td>
        <td colspan="2" align="center" class="borderTD"><b>
          Giá trị HHDV
          <br />
          (chưa có thuế GTGT)
        </b></td>
        <td colspan="2" align="center" class="borderTD"><b>Thuế GTGT</b></td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>A</b></td>
        <td align="left" class="borderTD"><b>Không phát sinh hoạt động mua, bán trong kỳ</b> (đánh dấu "X")</td>
        <td align="center" class="borderTD"><b>[21]</b></td>
        <td align="center" class="borderTD"><b>
          <xsl:choose>
            <xsl:when test="(ct21) and (translate(ct21,$lower,$upper)='TRUE')">X</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </b></td>
        <td colspan="2" class="borderTD">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>B</b></td>
        <td colspan="3" align="left" class="borderTD"><b>Thuế GTGT còn được khấu trừ kỳ trước chuyển sang</b></td>
        <td align="center" class="borderTD"><b>[22]</b></td>
        <td align="right" class="borderTD_note"><b>
          <xsl:choose>
            <xsl:when test="(ct22) and (ct22!='') and (ct22!=0)"><xsl:value-of select="format-number(ct22, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct22) and (ct22!='') and (ct22=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </b></td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>C</b></td>
        <td colspan="5" align="left" class="borderTD"><b>Kê khai thuế GTGT phải nộp Ngân sách nhà nước</b></td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>I</b></td>
        <td colspan="5" align="left" class="borderTD"><b>Hàng hoá, dịch vụ (HHDV) mua vào trong kỳ</b></td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>1</b></td>
        <td align="left" class="borderTD">Giá trị và thuế GTGT của hàng hoá, dịch vụ mua vào</td>
        <td align="center" class="borderTD"><b>[23]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(GiaTriVaThueGTGTHHDVMuaVao/ct23) and (GiaTriVaThueGTGTHHDVMuaVao/ct23!='') and (GiaTriVaThueGTGTHHDVMuaVao/ct23!=0)"><xsl:value-of select="format-number(GiaTriVaThueGTGTHHDVMuaVao/ct23, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(GiaTriVaThueGTGTHHDVMuaVao/ct23) and (GiaTriVaThueGTGTHHDVMuaVao/ct23!='') and (GiaTriVaThueGTGTHHDVMuaVao/ct23=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[24]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(GiaTriVaThueGTGTHHDVMuaVao/ct24) and (GiaTriVaThueGTGTHHDVMuaVao/ct24!='') and (GiaTriVaThueGTGTHHDVMuaVao/ct24!=0)"><xsl:value-of select="format-number(GiaTriVaThueGTGTHHDVMuaVao/ct24, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(GiaTriVaThueGTGTHHDVMuaVao/ct24) and (GiaTriVaThueGTGTHHDVMuaVao/ct24!='') and (GiaTriVaThueGTGTHHDVMuaVao/ct24=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>2</b></td>
        <td colspan="3" align="left" class="borderTD">Tổng số thuế GTGT được khấu trừ kỳ này</td>
        <td align="center" class="borderTD"><b>[25]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct25) and (ct25!='') and (ct25!=0)"><xsl:value-of select="format-number(ct25, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct25) and (ct25!='') and (ct25=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>II</b></td>
        <td colspan="5" align="left" class="borderTD"><b>Hàng hoá, dịch vụ bán ra trong kỳ</b></td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>1</b></td>
        <td align="left" class="borderTD">Hàng hóa, dịch vụ bán ra không chịu thuế GTGT</td>
        <td align="center" class="borderTD"><b>[26]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct26) and (ct26!='') and (ct26!=0)"><xsl:value-of select="format-number(ct26, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct26) and (ct26!='') and (ct26=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td colspan="2" class="borderTD">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>2</b></td>
        <td align="left" class="borderTD">Hàng hóa, dịch vụ bán ra chịu thuế GTGT ([27]=[29]+[30]+[32]+[32a]; [28]=[31]+[33])</td>
        <td align="center" class="borderTD"><b>[27]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuThueGTGT/ct27) and (HHDVBRaChiuThueGTGT/ct27!='') and (HHDVBRaChiuThueGTGT/ct27!=0)"><xsl:value-of select="format-number(HHDVBRaChiuThueGTGT/ct27, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuThueGTGT/ct27) and (HHDVBRaChiuThueGTGT/ct27!='') and (HHDVBRaChiuThueGTGT/ct27=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[28]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuThueGTGT/ct28) and (HHDVBRaChiuThueGTGT/ct28!='') and (HHDVBRaChiuThueGTGT/ct28!=0)"><xsl:value-of select="format-number(HHDVBRaChiuThueGTGT/ct28, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuThueGTGT/ct28) and (HHDVBRaChiuThueGTGT/ct28!='') and (HHDVBRaChiuThueGTGT/ct28=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD">a</td>
        <td align="left" class="borderTD">Hàng hoá, dịch vụ bán ra chịu thuế suất 0%</td>
        <td align="center" class="borderTD"><b>[29]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct29) and (ct29!='') and (ct29!=0)"><xsl:value-of select="format-number(ct29, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct29) and (ct29!='') and (ct29=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td colspan="2" class="borderTD">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="borderTD">b</td>
        <td align="left" class="borderTD">Hàng hoá, dịch vụ bán ra chịu thuế suất 5%</td>
        <td align="center" class="borderTD"><b>[30]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuTSuat5/ct30) and (HHDVBRaChiuTSuat5/ct30!='') and (HHDVBRaChiuTSuat5/ct30!=0)"><xsl:value-of select="format-number(HHDVBRaChiuTSuat5/ct30, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuTSuat5/ct30) and (HHDVBRaChiuTSuat5/ct30!='') and (HHDVBRaChiuTSuat5/ct30=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[31]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuTSuat5/ct31) and (HHDVBRaChiuTSuat5/ct31!='') and (HHDVBRaChiuTSuat5/ct31!=0)"><xsl:value-of select="format-number(HHDVBRaChiuTSuat5/ct31, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuTSuat5/ct31) and (HHDVBRaChiuTSuat5/ct31!='') and (HHDVBRaChiuTSuat5/ct31=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD">c</td>
        <td align="left" class="borderTD">Hàng hoá, dịch vụ bán ra chịu thuế suất 10%</td>
        <td align="center" class="borderTD"><b>[32]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct32) and (HHDVBRaChiuTSuat10/ct32!='') and (HHDVBRaChiuTSuat10/ct32!=0)"><xsl:value-of select="format-number(HHDVBRaChiuTSuat10/ct32, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct32) and (HHDVBRaChiuTSuat10/ct32!='') and (HHDVBRaChiuTSuat10/ct32=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[33]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct33) and (HHDVBRaChiuTSuat10/ct33!='') and (HHDVBRaChiuTSuat10/ct33!=0)"><xsl:value-of select="format-number(HHDVBRaChiuTSuat10/ct33, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct33) and (HHDVBRaChiuTSuat10/ct33!='') and (HHDVBRaChiuTSuat10/ct33=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD">d</td>
        <td align="left" class="borderTD">Hàng hoá, dịch vụ bán ra không tính thuế</td>
        <td align="center" class="borderTD"><b>[32a]</b></td>
        <td align="right" class="borderTD_note"><xsl:choose>
          <xsl:when test="(HHDVBRaKhongTinhThue/ct32a) and (HHDVBRaKhongTinhThue/ct32a!='') and (HHDVBRaKhongTinhThue/ct32a!=0)">
            <xsl:value-of select="format-number(HHDVBRaKhongTinhThue/ct32a, '#.##0,####;(#.##0,####)', 'vndong')"/>
          </xsl:when>
          <xsl:when test="(HHDVBRaKhongTinhThue/ct32a) and (HHDVBRaKhongTinhThue/ct32a!='') and (HHDVBRaKhongTinhThue/ct32a=0)">
            0
          </xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose></td>
        <td align="center" class="borderTD">&nbsp;</td>
        <td align="right" class="borderTD">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>3</b></td>
        <td align="left" class="borderTD">Tổng doanh thu và thuế GTGT của HHDV bán ra ([34]=[26]+[27]; [35]=[28])</td>
        <td align="center" class="borderTD"><b>[34]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(TongDThuVaThueGTGTHHDVBRa/ct34) and (TongDThuVaThueGTGTHHDVBRa/ct34!='') and (TongDThuVaThueGTGTHHDVBRa/ct34!=0)"><xsl:value-of select="format-number(TongDThuVaThueGTGTHHDVBRa/ct34, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(TongDThuVaThueGTGTHHDVBRa/ct34) and (TongDThuVaThueGTGTHHDVBRa/ct34!='') and (TongDThuVaThueGTGTHHDVBRa/ct34=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[35]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(TongDThuVaThueGTGTHHDVBRa/ct35) and (TongDThuVaThueGTGTHHDVBRa/ct35!='') and (TongDThuVaThueGTGTHHDVBRa/ct35!=0)"><xsl:value-of select="format-number(TongDThuVaThueGTGTHHDVBRa/ct35, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(TongDThuVaThueGTGTHHDVBRa/ct35) and (TongDThuVaThueGTGTHHDVBRa/ct35!='') and (TongDThuVaThueGTGTHHDVBRa/ct35=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>III</b></td>
        <td colspan="3" align="left" class="borderTD">Thuế GTGT phát sinh trong kỳ ([36]=[35]-[25])</td>
        <td align="center" class="borderTD"><b>[36]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct36) and (ct36!='') and (ct36!=0)"><xsl:value-of select="format-number(ct36, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct36) and (ct36!='') and (ct36=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>IV</b></td>
        <td colspan="5" align="left" class="borderTD"><b>Điều chỉnh tăng, giảm thuế GTGT còn được khấu trừ của các kỳ trước</b></td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>1</b></td>
        <td colspan="3" align="left" class="borderTD">Điều chỉnh giảm</td>
        <td align="center" class="borderTD"><b>[37]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct37) and (ct37!='') and (ct37!=0)"><xsl:value-of select="format-number(ct37, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct37) and (ct37!='') and (ct37=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>2</b></td>
        <td colspan="3" align="left" class="borderTD">Điều chỉnh tăng</td>
        <td align="center" class="borderTD"><b>[38]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct38) and (ct38!='') and (ct38!=0)"><xsl:value-of select="format-number(ct38, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct38) and (ct38!='') and (ct38=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>V</b></td>
        <td colspan="3" align="left" class="borderTD"><b>Thuế GTGT đã nộp ở địa phương khác của hoạt động kinh doanh xây dựng, lắp đặt, bán hàng, bất động sản ngoại tỉnh</b></td>
        <td align="center" class="borderTD"><b>[39]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct39) and (ct39!='') and (ct39!=0)"><xsl:value-of select="format-number(ct39, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct39) and (ct39!='') and (ct39=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>VI</b></td>
        <td colspan="5" align="left" class="borderTD"><b>Xác định nghĩa vụ thuế GTGT phải nộp trong kỳ:</b></td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>1</b></td>
        <td colspan="3" align="left" class="borderTD"><b>Thuế GTGT phải nộp của hoạt động sản xuất kinh doanh trong kỳ ([40a]=[36]-[22]+[37]-[38]-[39]<u>&gt;</u>0)</b></td>
        <td align="center" class="borderTD"><b>[40a]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct40a) and (ct40a!='') and (ct40a!=0)"><xsl:value-of select="format-number(ct40a, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct40a) and (ct40a!='') and (ct40a=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>2</b></td>
        <td colspan="3" align="left" class="borderTD"><b>Thuế GTGT mua vào của dự án đầu tư (cùng tỉnh, thành phố trực thuộc trung ương) được bù trừ với thuế GTGT còn phải nộp của hoạt động sản xuất kinh doanh cùng kỳ tính thuế</b></td>
        <td align="center" class="borderTD"><b>[40b]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct40b) and (ct40b!='') and (ct40b!=0)"><xsl:value-of select="format-number(ct40b, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct40b) and (ct40b!='') and (ct40b=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>3</b></td>
        <td colspan="3" align="left" class="borderTD"><b>Thuế GTGT còn phải nộp trong kỳ ([40]=[40a]-[40b])</b></td>
        <td align="center" class="borderTD"><b>[40]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct40) and (ct40!='') and (ct40!=0)"><xsl:value-of select="format-number(ct40, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct40) and (ct40!='') and (ct40=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>4</b></td>
        <td colspan="3" align="left" class="borderTD"><b>Thuế GTGT chưa khấu trừ hết kỳ này (nếu [41]=[36]-[22]+[37]-[38]-[39]&lt;0)</b></td>
        <td align="center" class="borderTD"><b>[41]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct41) and (ct41!='') and (ct41!=0)"><xsl:value-of select="format-number(ct41, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct41) and (ct41!='') and (ct41=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD">4.1</td>
        <td colspan="3" align="left" class="borderTD">Tổng số thuế GTGT đề nghị hoàn</td>
        <td align="center" class="borderTD"><b>[42]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct42) and (ct42!='') and (ct42!=0)"><xsl:value-of select="format-number(ct42, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct42) and (ct42!='') and (ct42=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD">4.2</td>
        <td colspan="3" align="left" class="borderTD">Thuế GTGT còn được khấu trừ chuyển kỳ sau ([43]=[41]-[42])</td>
        <td align="center" class="borderTD"><b>[43]</b></td>
        <td align="right" class="borderTD_note">
          <xsl:choose>
            <xsl:when test="(ct43) and (ct43!='') and (ct43!=0)"><xsl:value-of select="format-number(ct43, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(ct43) and (ct43!='') and (ct43=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
    </table>
    </xsl:for-each>
  </xsl:variable>

  <!-- Đưa vào Thông tin Cam kết -->
  <xsl:variable name="CamKet">
    <table>
      <tr>
        <td align="left" valign="middle">
          Tôi cam đoan số liệu khai trên là đúng và chịu trách nhiệm trước pháp luật về số liệu đã khai./.		
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin NV ĐLT và CKS -->
  <xsl:variable name="CKS">
    <table style="table-layout:auto">
      <tr>
        <td rowspan="2" width="3%">&nbsp;</td>
        <td align="center" valign="bottom" style="white-space:nowrap">
          <b>NHÂN VIÊN ĐẠI LÝ THUẾ</b>
        </td>
        <td rowspan="2">&nbsp;</td>
        <td rowspan="2" width="20%" align="center" valign="top" style="white-space:nowrap">
          <i>
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenTinhNNT) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenTinhNNT!='')"><xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenTinhNNT" /></xsl:when>
            <xsl:otherwise><span style="margin-left:100px">&nbsp;</span></xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/ngayKy) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/ngayKy!='')">, ngày <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/ngayKy,9,2)" /> tháng <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/ngayKy,6,2)" /> năm <xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/ngayKy,1,4)" /></xsl:when>
            <xsl:otherwise>, ngày <span style="margin-left:10px">&nbsp;</span> tháng <span style="margin-left:10px">&nbsp;</span> năm <span style="margin-left:30px">&nbsp;</span></xsl:otherwise>
          </xsl:choose>
          </i><br />
          <b>NGƯỜI NỘP THUẾ hoặc</b><br />
          <b>ĐẠI DIỆN HỢP PHÁP CỦA NGƯỜI NỘP THUẾ</b><br />
          <i>(Ký, ghi rõ họ tên; chức vụ và đóng dấu (nếu có))</i>
        </td>   
      </tr>
      <tr>
        <td width="20%" align="left" valign="top" style="white-space:nowrap">
          Họ và tên: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/NVienDLy/tenNVienDLyThue"/><br />
          Chứng chỉ hành nghề số: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/NVienDLy/cchiHNghe"/>
        </td>
      </tr>
      <tr><td colspan="4">&nbsp;</td></tr>
      <xsl:if test="count(/HSoThueDTu/TTCKYS/TTCKY)=0">
      <tr><td colspan="4">&nbsp;</td></tr>
      <tr><td colspan="4">&nbsp;</td></tr>
      </xsl:if>
      <tr><td colspan="4">&nbsp;</td></tr>
      <tr>
        <td colspan="3">&nbsp;</td>
        <td  align="center" valign="middle">
          <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/nguoiKy"/>
        </td>   
      </tr>
    </table>

    <table>
      <col width="49%"/>
      <col width="2%"/>
      <col width="49%"/>
      <xsl:if test="count(/HSoThueDTu/TTCKYS/TTCKY)!=0">
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td align="left" valign="middle" style="font-size:12px; padding-left: 40px;">
          <xsl:for-each select="/HSoThueDTu/TTCKYS/TTCKY[2]">
            <div style="position:relative; width:100%; vertical-align:middle;">
              <span style="position:absolute; margin-left:-40px;"><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAABL1BMVEUAAACZmZlmZmZmZmaZmZmenp5mZmZmZmbZ9tCLi4tmZmaZmZmc54Sz7KBmZmaZmZlmZmZmZmbj+Nzz/fB8fHyU5Hiu65mZmZlmZmaq6pVmZma17aKZmZmZmZlmZmZmZmbE8LWZmZmZmZmZmZmZmZlmZmaZmZmZmZlmZmbS9MeZmZnZ9s9mZmaZmZmZmZn///9mZmaC3mOJ4WtmZmaZmZmn6ZGo6ZKZmZm57qjE7La+765mZmbA77BmZmbH8blmZmZmZmaZmZmZmZnJ7L6jo6NmZmZmZmZmZmbU9MlmZmbR9MaZmZna9tGZmZlmZmaZmZlmZmbl+d6ZmZmZmZlmZmaZmZkzzAA2zQSxwatE0RW62rCpr6eB22I7zgqy36OjpaObm5un4JR82l1Q0yQ8zgtGdzynAAAAVHRSTlMA8B+AgAQV8SwO+ffm3K+SjCYjFgjn4eHh39zW0MfHwrm0r6uFfGJZWVRMNy8eFAr39Ovq6eXf29jV1dPMu6WilYh/bmZmY2BfSEdFQ0M9MCoeHRghSnZNAAABM0lEQVQ4y9XR11LDMBCF4ROIkzi9EVIhpAMp9N57r16lEfr7PwMSss0MI7iG79L/eq2R8Z9cBecNbzrsgppr25DcR4qq3ZTdhm2s9n2L1xCSh5Ehiz0Ry29pgHxPV6yOrQ3e8nJgZkjRbzMDxhKA+H4QaOYctpDo0ZU2YyOTQJIPhIEqSf3H3nNJ9IDZMS436MVs1kH09MK6vQPAI7r/DNwOH/BG8GlqtP/AWHe15UmIfgGhZnDr5invFjqvfGJjiTG2OG3eorzC8Gm9Hgcq1OE73nlPyS4PYdoE7ok6szy3Ux5Yju2BNKAT+fbnWDvw1REfNpUjwDlRCCf+TBRqWo58DSDWglqzQORUPNf3nEKp6CBajkNhlyy+a/WnJ8hUBX6dqOAnWohnx6U6Wj+q0MDf9AHdE0za6vtjbwAAAABJRU5ErkJggg==' /></span>
              <b><xsl:value-of select="SI"/></b><br/>
              <xsl:value-of select="SN"/>
            </div>
          </xsl:for-each>
        </td>
        <td>&nbsp;</td>
        <td align="left" valign="middle" style="font-size:12px; padding-left: 40px;">
          <xsl:for-each select="/HSoThueDTu/TTCKYS/TTCKY[1]">
            <div style="position:relative; width:100%; vertical-align:middle;">
              <span style="position:absolute; margin-left:-40px;"><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAABL1BMVEUAAACZmZlmZmZmZmaZmZmenp5mZmZmZmbZ9tCLi4tmZmaZmZmc54Sz7KBmZmaZmZlmZmZmZmbj+Nzz/fB8fHyU5Hiu65mZmZlmZmaq6pVmZma17aKZmZmZmZlmZmZmZmbE8LWZmZmZmZmZmZmZmZlmZmaZmZmZmZlmZmbS9MeZmZnZ9s9mZmaZmZmZmZn///9mZmaC3mOJ4WtmZmaZmZmn6ZGo6ZKZmZm57qjE7La+765mZmbA77BmZmbH8blmZmZmZmaZmZmZmZnJ7L6jo6NmZmZmZmZmZmbU9MlmZmbR9MaZmZna9tGZmZlmZmaZmZlmZmbl+d6ZmZmZmZlmZmaZmZkzzAA2zQSxwatE0RW62rCpr6eB22I7zgqy36OjpaObm5un4JR82l1Q0yQ8zgtGdzynAAAAVHRSTlMA8B+AgAQV8SwO+ffm3K+SjCYjFgjn4eHh39zW0MfHwrm0r6uFfGJZWVRMNy8eFAr39Ovq6eXf29jV1dPMu6WilYh/bmZmY2BfSEdFQ0M9MCoeHRghSnZNAAABM0lEQVQ4y9XR11LDMBCF4ROIkzi9EVIhpAMp9N57r16lEfr7PwMSss0MI7iG79L/eq2R8Z9cBecNbzrsgppr25DcR4qq3ZTdhm2s9n2L1xCSh5Ehiz0Ry29pgHxPV6yOrQ3e8nJgZkjRbzMDxhKA+H4QaOYctpDo0ZU2YyOTQJIPhIEqSf3H3nNJ9IDZMS436MVs1kH09MK6vQPAI7r/DNwOH/BG8GlqtP/AWHe15UmIfgGhZnDr5invFjqvfGJjiTG2OG3eorzC8Gm9Hgcq1OE73nlPyS4PYdoE7ok6szy3Ux5Yju2BNKAT+fbnWDvw1REfNpUjwDlRCCf+TBRqWo58DSDWglqzQORUPNf3nEKp6CBajkNhlyy+a/WnJ8hUBX6dqOAnWohnx6U6Wj+q0MDf9AHdE0za6vtjbwAAAABJRU5ErkJggg==' /></span>
              <b><xsl:value-of select="SI"/></b><br/>
              <xsl:value-of select="SN"/>
            </div>
          </xsl:for-each>
        </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      </xsl:if>
    </table>
  </xsl:variable>
  
  <!-- Đưa vào Ghi chú -->
  <xsl:variable name="GhiChu">
    <table>
      <tr>
        <td align="justify" valign="middle" style="font-size:13px; border-top:1px solid #000;">
          <i><b><u>Ghi chú:</u></b>
          <br />
          <span style="margin-left:20px">- GTGT: Giá trị Gia tăng</span>
          <br />
          <span style="margin-left:20px">- HHDV: Hàng hóa dịch vụ</span>
          </i>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Hỗ trợ hoạch toán phụ thuộc -->
  <xsl:variable name="HoachToanPhuThuoc">
    <table>
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td align="justify" valign="middle">
          <i><b><u>Hỗ trợ hạch toán MLNSNN</u></b></i>
          <br />
          Hạch toán chỉ tiêu [40] vào tiểu mục <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh/tieuMucHachToan"/>          
        </td>
      </tr>
    </table>
  </xsl:variable>
</xsl:stylesheet>