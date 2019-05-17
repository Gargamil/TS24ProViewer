<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="GTGT_01.xml" -->
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

  <xsl:decimal-format name="vndong" decimal-separator=',' grouping-separator='.' />
  <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyzàáảãạăằắẳẵặâầấẩẫậđèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ</xsl:variable>
  <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁẢÃẠĂẰẮẲẴẶÂẦẤẨẪẬĐÈÉẺẼẸÊỀẾỂỄỆÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴ</xsl:variable> 

  <xsl:template match="HSoThueDTu">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>GTGT_01_TT119</title>
        
		<!-- CSS -->
		<style type="text/css">
          table { width:100%; table-layout:auto empty-cells:show; border: 0; font-size:14px; font-family:"Times New Roman", Times, serif; border-collapse:collapse; table-layout:fixed; position:relative; }
          .pagePortrait { width:700px; }
          .pageLandscape { width:1000px; }
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

          <!-- Ghi chú -->
          <table>
            <tr>
              <td align="justify" valign="middle" style="font-size:13px; border-top:1px solid #000">
                <i><b><u>Ghi chú:</u></b>
                <br />
                <span style="margin-left:20px">- GTGT: Giá trị Gia tăng</span>
                <br />
                <span style="margin-left:20px">- HHDV: Hàng hóa dịch vụ</span>
                </i>
              </td>
            </tr>
          </table>
        </td></tr></table>

        <!-- PL01_1_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_1_GTGT) and (HSoKhaiThue/PLuc/PL01_1_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pageLandscape" align="center" style="table-layout:auto"><tr><td>
            <table style="table-layout:auto">
              <!-- Thông tin Mẫu số tờ khai và Mã vạch -->
              <xsl:choose>
                <xsl:when test="((HSoKhaiThue/PLuc/PL01_1_GTGT/MaVach/chiTiet) and count(HSoKhaiThue/PLuc/PL01_1_GTGT/MaVach/chiTiet) &gt; 1)">
                <tr>
                  <td colspan="3" width="100%" align="right" valign="top">
                    <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/MaVach/chiTiet">
                      <span style="margin:0px 10px">
                      <img src='data:image/png;base64,{.}' />
                      </span>
                    </xsl:for-each>
                  </td>
                </tr>
                <tr>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-1/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%">&nbsp;</td>
                </tr>
                </xsl:when>
                <xsl:when test="((HSoKhaiThue/PLuc/PL01_1_GTGT/MaVach/chiTiet) and count(HSoKhaiThue/PLuc/PL01_1_GTGT/MaVach/chiTiet) = 1)">
                <tr>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-1/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%" align="center" valign="top" style="white-space:nowrap">
                    <img src='data:image/png;base64,{HSoKhaiThue/PLuc/PL01_1_GTGT/MaVach/chiTiet}' />
                  </td>
                </tr>
                </xsl:when>
                <xsl:otherwise>
                <tr>
                  <td width="20%">&nbsp;</td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-1/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                </tr>
                </xsl:otherwise>
              </xsl:choose>
              <!-- Thông tin Tên tờ khai -->
              <tr>
                <td colspan="6" align="center" valign="top">
                  <span style="font-size:18px">
                  <b>BẢNG KÊ HOÁ ĐƠN, CHỨNG TỪ HÀNG HOÁ, DỊCH VỤ BÁN RA</b>
                  </span>
                  <br />
                  <i>(Kèm theo tờ khai thuế GTGT mẫu số 01/GTGT)</i>
                </td>
              </tr>
            </table>
  
            <!-- Thông tin kỳ kê khai -->
            <xsl:copy-of select="$KyKeKhai"/>
  
            <!-- Đưa vào Thông tin NNT -->
            <xsl:copy-of select="$NNTPhuLuc"/>
  
            <!-- Thông tin ĐLT -->
            <xsl:copy-of select="$DLTPhuLuc"/>
  
            <!-- Thông tin Chi tiết phụ lục -->
            <table cellpadding="2" cellspacing="0">
              <col width="4%"/>
              <col width="5%"/>
              <col width="5%"/>
              <col width="5%"/>
              <col width="8%"/>
              <col width="15%"/>
              <col width="8%"/>
              <col width="15%"/>
              <col width="12%"/>
              <col width="12%"/>
              <col width="11%"/>
              <tr>
                <td rowspan="2" align="center" class="borderTD"><b>STT</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Hoá đơn, chứng từ bán ra</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Tên người mua</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Mã số thuế người mua</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Mặt hàng</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Doanh số bán chưa có thuế GTGT</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Thuế GTGT</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ghi chú</b></td>
              </tr>
              <tr>
                <td align="center" class="borderTD"><b>Ký hiệu mẫu hoá đơn</b></td>
                <td align="center" class="borderTD"><b>Ký hiệu hóa đơn</b></td>
                <td align="center" class="borderTD"><b>Số hoá đơn</b></td>
                <td align="center" class="borderTD"><b>Ngày, tháng, năm phát hành</b></td>
              </tr>
              <tr>
                <td align="center" class="borderTD">(1)</td>
                <td align="center" class="borderTD">(2)</td>
                <td align="center" class="borderTD">(3)</td>
                <td align="center" class="borderTD">(4)</td>
                <td align="center" class="borderTD">(5)</td>
                <td align="center" class="borderTD">(6)</td>
                <td align="center" class="borderTD">(7)</td>
                <td align="center" class="borderTD">(8)</td>
                <td align="center" class="borderTD">(9)</td>
                <td align="center" class="borderTD">(10)</td>
                <td align="center" class="borderTD">(11)</td>
              </tr>
              <tr>
                <td colspan="11" align="left" class="borderTD"><i>1. Hàng hóa, dịch vụ không chịu thuế giá trị gia tăng (GTGT):</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVKChiuThue/ChiTietHHDVKChiuThue/HDonBRa) or (HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVKChiuThue/ChiTietHHDVKChiuThue/HDonBRa='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVKChiuThue/ChiTietHHDVKChiuThue/HDonBRa">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNMUA) and (tenNMUA!='')"><xsl:value-of select="tenNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNMUA) and (mstNMUA!='')"><xsl:value-of select="mstNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue!=0)"><xsl:value-of select="format-number(dsoBanChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVKChiuThue[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongDThuBRaKChiuThue) and (tongDThuBRaKChiuThue!='') and (tongDThuBRaKChiuThue!=0)"><xsl:value-of select="format-number(tongDThuBRaKChiuThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongDThuBRaKChiuThue) and (tongDThuBRaKChiuThue!='') and (tongDThuBRaKChiuThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="11" align="left" class="borderTD"><i>2. Hàng hóa, dịch vụ chịu thuế suất thuế GTGT 0% (*):</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue0/ChiTietHHDVThue0/HDonBRa) or (HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue0/ChiTietHHDVThue0/HDonBRa='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue0/ChiTietHHDVThue0/HDonBRa">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNMUA) and (tenNMUA!='')"><xsl:value-of select="tenNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNMUA) and (mstNMUA!='')"><xsl:value-of select="mstNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue!=0)"><xsl:value-of select="format-number(dsoBanChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue0[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongDThuBRaThue0) and (tongDThuBRaThue0!='') and (tongDThuBRaThue0!=0)"><xsl:value-of select="format-number(tongDThuBRaThue0, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongDThuBRaThue0) and (tongDThuBRaThue0!='') and (tongDThuBRaThue0=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueBRaThue0) and (tongThueBRaThue0!='') and (tongThueBRaThue0!=0)"><xsl:value-of select="format-number(tongThueBRaThue0, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueBRaThue0) and (tongThueBRaThue0!='') and (tongThueBRaThue0=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="11" align="left" class="borderTD"><i>3. Hàng hóa, dịch vụ chịu thuế suất thuế GTGT 5%:</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue5/ChiTietHHDVThue5/HDonBRa) or (HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue5/ChiTietHHDVThue5/HDonBRa='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue5/ChiTietHHDVThue5/HDonBRa">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNMUA) and (tenNMUA!='')"><xsl:value-of select="tenNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNMUA) and (mstNMUA!='')"><xsl:value-of select="mstNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue!=0)"><xsl:value-of select="format-number(dsoBanChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue5[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongDThuBRaThue5) and (tongDThuBRaThue5!='') and (tongDThuBRaThue5!=0)"><xsl:value-of select="format-number(tongDThuBRaThue5, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongDThuBRaThue5) and (tongDThuBRaThue5!='') and (tongDThuBRaThue5=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueBRaThue5) and (tongThueBRaThue5!='') and (tongThueBRaThue5!=0)"><xsl:value-of select="format-number(tongThueBRaThue5, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueBRaThue5) and (tongThueBRaThue5!='') and (tongThueBRaThue5=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="11" align="left" class="borderTD"><i>4. Hàng hóa, dịch vụ chịu thuế suất thuế GTGT 10%:</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue10/ChiTietHHDVThue10/HDonBRa) or (HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue10/ChiTietHHDVThue10/HDonBRa='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue10/ChiTietHHDVThue10/HDonBRa">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNMUA) and (tenNMUA!='')"><xsl:value-of select="tenNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNMUA) and (mstNMUA!='')"><xsl:value-of select="mstNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue!=0)"><xsl:value-of select="format-number(dsoBanChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVThue10[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongDThuBRaThue10) and (tongDThuBRaThue10!='') and (tongDThuBRaThue10!=0)"><xsl:value-of select="format-number(tongDThuBRaThue10, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongDThuBRaThue10) and (tongDThuBRaThue10!='') and (tongDThuBRaThue10=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueBRaThue10) and (tongThueBRaThue10!='') and (tongThueBRaThue10!=0)"><xsl:value-of select="format-number(tongThueBRaThue10, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueBRaThue10) and (tongThueBRaThue10!='') and (tongThueBRaThue10=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="11" align="left" class="borderTD"><i>5. Hàng hóa, dịch vụ không phải tổng hợp trên tờ khai 01/GTGT:</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVBRaKhongTHop/ChiTietHHDVBRaKhongTHop/HDonBRa) or (HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVBRaKhongTHop/ChiTietHHDVBRaKhongTHop/HDonBRa='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVBRaKhongTHop/ChiTietHHDVBRaKhongTHop/HDonBRa">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNMUA) and (tenNMUA!='')"><xsl:value-of select="tenNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNMUA) and (mstNMUA!='')"><xsl:value-of select="mstNMUA"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue!=0)"><xsl:value-of select="format-number(dsoBanChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoBanChuaThue) and (dsoBanChuaThue!='') and (dsoBanChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT/HHDVBRaKhongTHop[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongDThuBRaKoKKhai) and (tongDThuBRaKoKKhai!='') and (tongDThuBRaKoKKhai!=0)"><xsl:value-of select="format-number(tongDThuBRaKoKKhai, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongDThuBRaKoKKhai) and (tongDThuBRaKoKKhai!='') and (tongDThuBRaKoKKhai=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueBRaKoKKhai) and (tongThueBRaKoKKhai!='') and (tongThueBRaKoKKhai!=0)"><xsl:value-of select="format-number(tongThueBRaKoKKhai, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueBRaKoKKhai) and (tongThueBRaKoKKhai!='') and (tongThueBRaKoKKhai=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
            </table>

            <!-- Thông tin Tổng cộng -->
            <table>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_1_GTGT[1]">
              <tr>
                <td width="10%">&nbsp;</td>
                <td align="left" valign="middle">
                  Tổng doanh thu hàng hóa, dịch vụ bán ra (**):
                </td>
                <td width="30%" align="right" valign="middle">
                  <xsl:choose>
                    <xsl:when test="(tongDThuBRa) and (tongDThuBRa!='') and (tongDThuBRa!=0)"><xsl:value-of select="format-number(tongDThuBRa, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongDThuBRa) and (tongDThuBRa!='') and (tongDThuBRa=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td width="10%">&nbsp;</td>
              </tr>
              <tr>
                <td width="10%">&nbsp;</td>
                <td align="left" valign="middle">
                  Tổng doanh thu hàng hoá, dịch vụ bán ra chịu thuế GTGT (***):
                </td>
                <td width="30%" align="right" valign="middle">
                  <xsl:choose>
                    <xsl:when test="(tongDThuBRaChiuThue) and (tongDThuBRaChiuThue!='') and (tongDThuBRaChiuThue!=0)"><xsl:value-of select="format-number(tongDThuBRaChiuThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongDThuBRaChiuThue) and (tongDThuBRaChiuThue!='') and (tongDThuBRaChiuThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td width="10%">&nbsp;</td>
              </tr>
              <tr>
                <td width="10%">&nbsp;</td>
                <td align="left" valign="middle">
                  Tổng thuế GTGT của hàng hóa, dịch vụ bán ra (****):
                </td>
                <td width="30%" align="right" valign="middle">
                  <xsl:choose>
                    <xsl:when test="(tongThueBRa) and (tongThueBRa!='') and (tongThueBRa!=0)"><xsl:value-of select="format-number(tongThueBRa, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueBRa) and (tongThueBRa!='') and (tongThueBRa=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td width="10%">&nbsp;</td>
              </tr>
              </xsl:for-each>
            </table>

            <!-- Thông tin Cam kết -->
            <xsl:copy-of select="$CamKetPhuLuc"/>
            <br />
  
            <!-- Thông tin NV ĐLT và CKS -->
            <xsl:copy-of select="$CKS"/>
            
            <!-- Ghi chú -->
            <table>
              <tr>
                <td align="justify" valign="middle" style="font-size:13px; border-top:1px solid #000">
                  <i><b><u>Ghi chú:</u></b>
                  <br />
                  (*) Trường hợp phát sinh hàng hóa, dịch vụ chịu thuế suất thuế GTGT 0% thì lập gửi kèm theo Bảng kê hàng hóa, dich vụ được áp dụng thuế suất thuế GTGT 0%- mẫu số 01-3/GTGT.
                  <br />
                  (**) Tổng doanh thu hàng hóa, dịch vụ bán ra là tổng cộng số liệu tại cột 8 của dòng tổng của các chỉ tiêu 1, 2, 3, 4.
                  <br />
                  (***) Tổng doanh thu hàng hóa, dịch vụ bán ra chịu thuế GTGT là tổng cộng số liệu tại cột 9 của  dòng tổng của các chỉ tiêu 2, 3, 4.
                  <br />
                  (****) Tổng số thuế GTGT của hàng hóa, dịch vụ bán ra là tổng cộng số liệu tại cột 10 của  dòng tổng của các chỉ tiêu 2, 3, 4.
                   </i>
                </td>
              </tr>
            </table>
          </td></tr></table>
        </xsl:if>

        <!-- PL01_2_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_2_GTGT) and (HSoKhaiThue/PLuc/PL01_2_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pageLandscape" align="center" style="table-layout:auto"><tr><td>
            <table style="table-layout:auto">
              <!-- Thông tin Mẫu số tờ khai và Mã vạch -->
              <xsl:choose>
                <xsl:when test="((HSoKhaiThue/PLuc/PL01_2_GTGT/MaVach/chiTiet) and count(HSoKhaiThue/PLuc/PL01_2_GTGT/MaVach/chiTiet) &gt; 1)">
                <tr>
                  <td colspan="3" width="100%" align="right" valign="top">
                    <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/MaVach/chiTiet">
                      <span style="margin:0px 10px">
                      <img src='data:image/png;base64,{.}' />
                      </span>
                    </xsl:for-each>
                  </td>
                </tr>
                <tr>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-2/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%">&nbsp;</td>
                </tr>
                </xsl:when>
                <xsl:when test="((HSoKhaiThue/PLuc/PL01_2_GTGT/MaVach/chiTiet) and count(HSoKhaiThue/PLuc/PL01_2_GTGT/MaVach/chiTiet) = 1)">
                <tr>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-2/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%" align="center" valign="top" style="white-space:nowrap">
                    <img src='data:image/png;base64,{HSoKhaiThue/PLuc/PL01_2_GTGT/MaVach/chiTiet}' />
                  </td>
                </tr>
                </xsl:when>
                <xsl:otherwise>
                <tr>
                  <td width="20%">&nbsp;</td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-2/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                </tr>
                </xsl:otherwise>
              </xsl:choose>
              <!-- Thông tin Tên tờ khai -->
              <tr>
                <td colspan="6" align="center" valign="top">
                  <span style="font-size:18px">
                  <b>BẢNG KÊ HÓA ĐƠN, CHỨNG TỪ CỦA HÀNG HOÁ, DỊCH VỤ MUA VÀO</b>
                  </span>
                  <br />
                  <i>(Kèm theo tờ khai thuế GTGT mẫu số 01/GTGT)</i>
                </td>
              </tr>
            </table>
  
            <!-- Thông tin kỳ kê khai -->
            <xsl:copy-of select="$KyKeKhai"/>
  
            <!-- Đưa vào Thông tin NNT -->
            <xsl:copy-of select="$NNTPhuLuc"/>
  
            <!-- Thông tin ĐLT -->
            <xsl:copy-of select="$DLTPhuLuc"/>
  
            <!-- Thông tin Chi tiết phụ lục -->
            <table cellpadding="2" cellspacing="0">
              <col width="3%"/>
              <col width="5%"/>
              <col width="5%"/>
              <col width="5%"/>
              <col width="8%"/>
              <col width="13%"/>
              <col width="8%"/>
              <col width="14%"/>
              <col width="12%"/>
              <col width="5%"/>
              <col width="12%"/>
              <col width="10%"/>
              <tr>
                <td rowspan="2" align="center" class="borderTD"><b>STT</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Hoá đơn, chứng từ, biên lai nộp thuế</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Tên người bán</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Mã số thuế người bán</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Mặt hàng</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Giá trị HHDV mua vào chưa có thuế</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Thuế suất (%)</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Thuế GTGT</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ghi chú hoặc thời hạn thanh toán trả chậm</b></td>
              </tr>
              <tr>
                <td align="center" class="borderTD"><b>Ký hiệu mẫu hoá đơn</b></td>
                <td align="center" class="borderTD"><b>Ký hiệu hóa đơn</b></td>
                <td align="center" class="borderTD"><b>Số hoá đơn</b></td>
                <td align="center" class="borderTD"><b>Ngày, tháng, năm phát hành</b></td>
              </tr>
              <tr>
                <td align="center" class="borderTD">(1)</td>
                <td align="center" class="borderTD">(2)</td>
                <td align="center" class="borderTD">(3)</td>
                <td align="center" class="borderTD">(4)</td>
                <td align="center" class="borderTD">(5)</td>
                <td align="center" class="borderTD">(6)</td>
                <td align="center" class="borderTD">(7)</td>
                <td align="center" class="borderTD">(8)</td>
                <td align="center" class="borderTD">(9)</td>
                <td align="center" class="borderTD">(10)</td>
                <td align="center" class="borderTD">(11)</td>
                <td align="center" class="borderTD">(12)</td>
              </tr>
              <tr>
                <td colspan="12" align="left" class="borderTD"><i>1. Hàng hoá, dịch vụ dùng riêng cho SXKD chịu thuế GTGT và sử dụng cho các hoạt động cung cấp hàng hoá, dịch vụ không kê khai, nộp thuế GTGT đủ điều kiện khấu trừ thuế:</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDRieng/ChiTietHHDVDRieng/HDonMVao) or (HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDRieng/ChiTietHHDVDRieng/HDonMVao='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDRieng/ChiTietHHDVDRieng/HDonMVao">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNBAN) and (tenNBAN!='')"><xsl:value-of select="tenNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNBAN) and (mstNBAN!='')"><xsl:value-of select="mstNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue!=0)"><xsl:value-of select="format-number(dsoMuaChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat!=0)"><xsl:value-of select="format-number(thueSuat, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDRieng[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao!=0)"><xsl:value-of select="format-number(tongGTriMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao!=0)"><xsl:value-of select="format-number(tongThueMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="12" align="left" class="borderTD"><i>2. Hàng hoá, dịch vụ không đủ điều kiện khấu trừ:</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKhongKTru/ChiTietHHDVKhongKTru/HDonMVao) or (HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKhongKTru/ChiTietHHDVKhongKTru/HDonMVao='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKhongKTru/ChiTietHHDVKhongKTru/HDonMVao">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNBAN) and (tenNBAN!='')"><xsl:value-of select="tenNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNBAN) and (mstNBAN!='')"><xsl:value-of select="mstNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue!=0)"><xsl:value-of select="format-number(dsoMuaChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat!=0)"><xsl:value-of select="format-number(thueSuat, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKhongKTru[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao!=0)"><xsl:value-of select="format-number(tongGTriMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao!=0)"><xsl:value-of select="format-number(tongThueMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="12" align="left" class="borderTD"><i>3. Hàng hoá, dịch vụ dùng chung cho SXKD chịu thuế và không chịu thuế đủ điều kiện khấu trừ thuế:</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDChung/ChiTietHHDVDChung/HDonMVao) or (HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDChung/ChiTietHHDVDChung/HDonMVao='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDChung/ChiTietHHDVDChung/HDonMVao">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNBAN) and (tenNBAN!='')"><xsl:value-of select="tenNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNBAN) and (mstNBAN!='')"><xsl:value-of select="mstNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue!=0)"><xsl:value-of select="format-number(dsoMuaChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat!=0)"><xsl:value-of select="format-number(thueSuat, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVDChung[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao!=0)"><xsl:value-of select="format-number(tongGTriMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao!=0)"><xsl:value-of select="format-number(tongThueMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="12" align="left" class="borderTD"><i>4. Hàng hóa, dịch vụ dùng cho dự án đầu tư đủ điều kiện được khấu trừ thuế (*):</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKTru/ChiTietHHDVKTru/HDonMVao) or (HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKTru/ChiTietHHDVKTru/HDonMVao='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKTru/ChiTietHHDVKTru/HDonMVao">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNBAN) and (tenNBAN!='')"><xsl:value-of select="tenNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNBAN) and (mstNBAN!='')"><xsl:value-of select="mstNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue!=0)"><xsl:value-of select="format-number(dsoMuaChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat!=0)"><xsl:value-of select="format-number(thueSuat, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVKTru[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao!=0)"><xsl:value-of select="format-number(tongGTriMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao!=0)"><xsl:value-of select="format-number(tongThueMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
              <tr>
                <td colspan="12" align="left" class="borderTD"><i>5. Hàng hóa, dịch vụ không phải tổng hợp trên tờ khai 01/GTGT:</i></td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVMVaoKhongTHop/ChiTietHHDVMVaoKhongTHop/HDonMVao) or (HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVMVaoKhongTHop/ChiTietHHDVMVaoKhongTHop/HDonMVao='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVMVaoKhongTHop/ChiTietHHDVMVaoKhongTHop/HDonMVao">
              <tr>
                <td align="center" class="borderTD"><xsl:number format="1"/></td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuMauHDon) and (kyHieuMauHDon!='')"><xsl:value-of select="kyHieuMauHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(kyHieuHDon) and (kyHieuHDon!='')"><xsl:value-of select="kyHieuHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(soHDon) and (soHDon!='')"><xsl:value-of select="soHDon"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ngayPHanh) and (ngayPHanh!='')"><xsl:value-of select="concat(substring(ngayPHanh,9,2),'/',substring(ngayPHanh,6,2),'/',substring(ngayPHanh,1,4))"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(tenNBAN) and (tenNBAN!='')"><xsl:value-of select="tenNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(mstNBAN) and (mstNBAN!='')"><xsl:value-of select="mstNBAN"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(matHang) and (matHang!='')"><xsl:value-of select="matHang"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue!=0)"><xsl:value-of select="format-number(dsoMuaChuaThue, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(dsoMuaChuaThue) and (dsoMuaChuaThue!='') and (dsoMuaChuaThue=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="center" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat!=0)"><xsl:value-of select="format-number(thueSuat, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueSuat) and (thueSuat!='') and (thueSuat=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="right" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT!=0)"><xsl:value-of select="format-number(thueGTGT, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(thueGTGT) and (thueGTGT!='') and (thueGTGT=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td align="left" class="borderTD">
                  <xsl:choose>
                    <xsl:when test="(ghiChu) and (ghiChu!='')"><xsl:value-of select="ghiChu"/></xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT/HHDVMVaoKhongTHop[1]">
              <tr>
                <td colspan="8" align="center" class="borderTD"><b>Tổng:</b></td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao!=0)"><xsl:value-of select="format-number(tongGTriMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
                <td align="right" class="borderTD"><b>
                  <xsl:choose>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao!=0)"><xsl:value-of select="format-number(tongThueMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </b></td>
                <td class="borderTD">&nbsp;</td>
              </tr>
              </xsl:for-each>
            </table>

            <!-- Thông tin Tổng cộng -->
            <table>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_2_GTGT[1]">
              <tr>
                <td width="10%">&nbsp;</td>
                <td align="left" valign="middle">
                  Tổng giá trị hàng hoá, dịch vụ mua vào(**):
                </td>
                <td width="30%" align="right" valign="middle">
                  <xsl:choose>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao!=0)"><xsl:value-of select="format-number(tongGTriMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongGTriMVao) and (tongGTriMVao!='') and (tongGTriMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td width="10%">&nbsp;</td>
              </tr>
              <tr>
                <td width="10%">&nbsp;</td>
                <td align="left" valign="middle">
                  Tổng số thuế GTGT của hàng hoá, dịch vụ mua vào(***):
                </td>
                <td width="30%" align="right" valign="middle">
                  <xsl:choose>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao!=0)"><xsl:value-of select="format-number(tongThueMVao, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
                    <xsl:when test="(tongThueMVao) and (tongThueMVao!='') and (tongThueMVao=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td width="10%">&nbsp;</td>
              </tr>
              </xsl:for-each>
            </table>

            <!-- Thông tin Cam kết -->
            <xsl:copy-of select="$CamKetPhuLuc"/>
            <br />
  
            <!-- Thông tin NV ĐLT và CKS -->
            <xsl:copy-of select="$CKS"/>
            
            <!-- Ghi chú -->
            <table>
              <tr>
                <td align="justify" valign="middle" style="font-size:13px; border-top:1px solid #000">
                  <i><b><u>Ghi chú:</u></b>
                  <br />
                  (*) Tổng hợp theo từng dự án đầu tư thuộc trường hợp được hoàn thuế GTGT.
                  <br />
                  (**) Tổng doanh thu hàng hóa, dịch vụ mua vào  là tổng cộng số liệu tại cột 9 của dòng tổng của các chỉ tiêu 1, 2, 3, 4.
                  <br />
                  (***) Tổng số thuế GTGT của hàng hóa, dịch vụ  mua vào là tổng cộng số liệu tại cột 11 của dòng tổng của các chỉ tiêu 1, 2, 3, 4.
                  <br />
                  <span style="margin-left:20px">- GTGT: giá trị gia tăng.</span>
                  <br />
                  <span style="margin-left:20px">- SXKD: sản xuất kinh doanh.</span>
                  <br />
                  <span style="margin-left:20px">- HHDV: hàng hóa dịch vụ.</span>
                   </i>
                </td>
              </tr>
            </table>
          </td></tr></table>
        </xsl:if>

        <!-- PL01_3_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_3_GTGT) and (HSoKhaiThue/PLuc/PL01_3_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table align="center" style="table-layout:auto; width:1800px;"><tr><td>
            <table style="table-layout:auto">
              <!-- Thông tin Mẫu số tờ khai và Mã vạch -->
              <xsl:choose>
                <xsl:when test="((HSoKhaiThue/PLuc/PL01_3_GTGT/MaVach/chiTiet) and count(HSoKhaiThue/PLuc/PL01_3_GTGT/MaVach/chiTiet) &gt; 1)">
                <tr>
                  <td colspan="3" width="100%" align="right" valign="top">
                    <xsl:for-each select="HSoKhaiThue/PLuc/PL01_3_GTGT/MaVach/chiTiet">
                      <span style="margin:0px 10px">
                      <img src='data:image/png;base64,{.}' />
                      </span>
                    </xsl:for-each>
                  </td>
                </tr>
                <tr>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-3/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%">&nbsp;</td>
                </tr>
                </xsl:when>
                <xsl:when test="((HSoKhaiThue/PLuc/PL01_3_GTGT/MaVach/chiTiet) and count(HSoKhaiThue/PLuc/PL01_3_GTGT/MaVach/chiTiet) = 1)">
                <tr>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-3/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%" align="center" valign="top" style="white-space:nowrap">
                    <img src='data:image/png;base64,{HSoKhaiThue/PLuc/PL01_3_GTGT/MaVach/chiTiet}' />
                  </td>
                </tr>
                </xsl:when>
                <xsl:otherwise>
                <tr>
                  <td width="20%">&nbsp;</td>
                  <td align="center" valign="bottom">
                    <b>PHỤ LỤC</b>
                  </td>
                  <td width="20%" align="center" valign="top" style="font-size:13px; white-space:nowrap">
                    <div style="border:1px solid #000; padding:3px;">
                    Mẫu số: <b>01-3/GTGT</b><br />
                    <i>(Ban hành kèm theo Thông tư<br />
                    số 156/2013/TT-BTC ngày<br />
                    06/11/2013 của Bộ Tài chính)</i>
                    </div>
                  </td>
                </tr>
                </xsl:otherwise>
              </xsl:choose>
              <!-- Thông tin Tên tờ khai -->
              <tr>
                <td colspan="6" align="center" valign="top">
                  <span style="font-size:18px">
                  <b>BẢNG KÊ HÀNG HOÁ, DỊCH VỤ ĐƯỢC ÁP DỤNG THUẾ SUẤT THUẾ GTGT 0%</b>
                  </span>
                  <br />
                  <i>(Kèm theo Tờ khai thuế giá trị gia tăng mẫu số 01/GTGT)</i>
                </td>
              </tr>
            </table>
  
            <!-- Thông tin kỳ kê khai -->
            <xsl:copy-of select="$KyKeKhai"/>
  
            <!-- Đưa vào Thông tin NNT -->
            <xsl:copy-of select="$NNTPhuLuc"/>
  
            <!-- Thông tin ĐLT -->
            <xsl:copy-of select="$DLTPhuLuc"/>
  
            <!-- Thông tin Chi tiết phụ lục -->
            <table cellpadding="1" cellspacing="0" style="font-size:10px">
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="3%" />
              <col width="4%" />
              <col width="3%" />
              <tr>
                <td rowspan="4" align="center" class="borderTD"><b>Số TT</b></td>
                <td colspan="6" align="center" class="borderTD"><b>Hợp đồng xuất khẩu</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Tờ khai hàng hoá xuất khẩu</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Hoá đơn xuất khẩu</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Chứng từ thanh toán qua ngân hàng</b></td>
                <td colspan="13" align="center" class="borderTD"><b>Chứng từ thanh toán bù trừ</b></td>
                <td rowspan="4" align="center" class="borderTD"><b>Ghi chú</b></td>
              </tr>
              <tr>
                <td rowspan="3" align="center" class="borderTD"><b>Số</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Ngày</b></td>
                <td colspan="2" align="center" class="borderTD"><b>Trị giá</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Hình thức, phương thức thanh toán</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Thời hạn thanh toán</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Tờ khai số</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Ngày đăng ký</b></td>
                <td colspan="2" align="center" class="borderTD"><b>Trị giá</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Số</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Ngày</b></td>
                <td colspan="2" align="center" class="borderTD"><b>Trị giá</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Số</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Ngày</b></td>
                <td colspan="2" align="center" class="borderTD"><b>Trị giá</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Văn bản xác nhận với phía nước ngoài</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Hợp đồng nhập khẩu</b></td>
                <td colspan="4" align="center" class="borderTD"><b>Tờ khai hàng hoá nhập khẩu</b></td>
                <td rowspan="3" align="center" class="borderTD"><b>Chứng từ thanh toán bù trừ khác</b></td>
              </tr>
              <tr>
                <td rowspan="2" align="center" class="borderTD"><b>Ngoại tệ</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Đồng Việt Nam </b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ngoại tệ</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Đồng Việt Nam </b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ngoại tệ</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Đồng Việt Nam </b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ngoại tệ</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Đồng Việt Nam</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Số</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ngày</b></td>
                <td colspan="2" align="center" class="borderTD"><b>Trị giá</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Số</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ngày</b></td>
                <td colspan="2" align="center" class="borderTD"><b>Trị giá</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Tờ khai số</b></td>
                <td rowspan="2" align="center" class="borderTD"><b>Ngày đăng ký</b></td>
            
                <td colspan="2" align="center" class="borderTD"><b>Trị giá</b></td>
              </tr>
              <tr>
                <td align="center" class="borderTD"><b>Ngoại tệ</b></td>
                <td align="center" class="borderTD"><b>Đồng Việt Nam</b></td>
                <td align="center" class="borderTD"><b>Ngoại tệ</b></td>
                <td align="center" class="borderTD"><b>Đồng Việt Nam</b></td>
                <td align="center" class="borderTD"><b>Ngoại tệ</b></td>
                <td align="center" class="borderTD"><b>Đồng Việt Nam</b></td>
              </tr>
              <tr>
                <td align="center" class="borderTD">1</td>
                <td align="center" class="borderTD">2</td>
                <td align="center" class="borderTD">3</td>
                <td align="center" class="borderTD">4</td>
                <td align="center" class="borderTD">5</td>
                <td align="center" class="borderTD">6</td>
                <td align="center" class="borderTD">7</td>
                <td align="center" class="borderTD">8</td>
                <td align="center" class="borderTD">9</td>
                <td align="center" class="borderTD">10</td>
                <td align="center" class="borderTD">11</td>
                <td align="center" class="borderTD">12</td>
                <td align="center" class="borderTD">13</td>
                <td align="center" class="borderTD">14</td>
                <td align="center" class="borderTD">15</td>
                <td align="center" class="borderTD">16</td>
                <td align="center" class="borderTD">17</td>
                <td align="center" class="borderTD">18</td>
                <td align="center" class="borderTD">19</td>
                <td align="center" class="borderTD">20</td>
                <td align="center" class="borderTD">21</td>
                <td align="center" class="borderTD">22</td>
                <td align="center" class="borderTD">23</td>
                <td align="center" class="borderTD">24</td>
                <td align="center" class="borderTD">25</td>
                <td align="center" class="borderTD">26</td>
                <td align="center" class="borderTD">27</td>
                <td align="center" class="borderTD">28</td>
                <td align="center" class="borderTD">29</td>
                <td align="center" class="borderTD">30</td>
                <td align="center" class="borderTD">31</td>
                <td align="center" class="borderTD">32</td>
                <td align="center" class="borderTD">33</td>
              </tr>
              <xsl:if test="not(HSoKhaiThue/PLuc/PL01_3_GTGT/ChiTietBangKeHH) or (HSoKhaiThue/PLuc/PL01_3_GTGT/ChiTietBangKeHH='')">
              <tr><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td><td class="borderTD">&nbsp;</td></tr>
              </xsl:if>
              <xsl:for-each select="HSoKhaiThue/PLuc/PL01_3_GTGT/ChiTietBangKeHH">
              <tr> 
                <td align="center" class="borderTD"><xsl:value-of select="position()"/></td>
                <td align="center" class="borderTD_note"><xsl:value-of select="HopDongXuatKhau/so"/></td>
                <td align="center" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(HopDongXuatKhau/ngay) and (HopDongXuatKhau/ngay!='')"><xsl:value-of select="concat(substring(HopDongXuatKhau/ngay,9,2),'/',substring(HopDongXuatKhau/ngay,6,2),'/',substring(HopDongXuatKhau/ngay,1,4))"/></xsl:when>
                    <xsl:otherwise><div style="display:inline-block; margin:0px 40px;">&nbsp;</div></xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="right" class="borderTD_note"><xsl:value-of select="HopDongXuatKhau/ngoaiTe"/></td>
                <td align="right" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(HopDongXuatKhau/dongVietNam) and (HopDongXuatKhau/dongVietNam!='') and (HopDongXuatKhau/dongVietNam!=0)"><xsl:value-of select="format-number(HopDongXuatKhau/dongVietNam,'#.##0,####;(#.##0,####)','vndong')"/></xsl:when>
                    <xsl:when test="(HopDongXuatKhau/dongVietNam) and (HopDongXuatKhau/dongVietNam!='') and (HopDongXuatKhau/dongVietNam=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="left" class="borderTD_note"><xsl:value-of select="HopDongXuatKhau/hinhThucThanhToanHDongXKhau"/></td>
                <td align="center" class="borderTD_note"><xsl:value-of select="HopDongXuatKhau/thoiHanThanhToanHDongXKhau"/></td>
                <td align="center" class="borderTD_note"><xsl:value-of select="ToKhaiHHoaXKhau/so"/></td>
                <td align="center" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ToKhaiHHoaXKhau/ngay) and (ToKhaiHHoaXKhau/ngay!='')"><xsl:value-of select="concat(substring(ToKhaiHHoaXKhau/ngay,9,2),'/',substring(ToKhaiHHoaXKhau/ngay,6,2),'/',substring(ToKhaiHHoaXKhau/ngay,1,4))"/></xsl:when>
                    <xsl:otherwise><div style="display:inline-block; margin:0px 40px;">&nbsp;</div></xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="right" class="borderTD_note"><xsl:value-of select="ToKhaiHHoaXKhau/ngoaiTe"/></td>
                <td align="right" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ToKhaiHHoaXKhau/dongVietNam) and (ToKhaiHHoaXKhau/dongVietNam!='') and (ToKhaiHHoaXKhau/dongVietNam!=0)"><xsl:value-of select="format-number(ToKhaiHHoaXKhau/dongVietNam,'#.##0,####;(#.##0,####)','vndong')"/></xsl:when>
                    <xsl:when test="(ToKhaiHHoaXKhau/dongVietNam) and (ToKhaiHHoaXKhau/dongVietNam!='') and (ToKhaiHHoaXKhau/dongVietNam=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="center" class="borderTD_note"><xsl:value-of select="HoaDonXKhau/so"/></td>
                
                <td align="center" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(HoaDonXKhau/ngay) and (HoaDonXKhau/ngay!='')"><xsl:value-of select="concat(substring(HoaDonXKhau/ngay,9,2),'/',substring(HoaDonXKhau/ngay,6,2),'/',substring(HoaDonXKhau/ngay,1,4))"/></xsl:when>
                    <xsl:otherwise><div style="display:inline-block; margin:0px 40px;">&nbsp;</div></xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="right" class="borderTD_note"><xsl:value-of select="HoaDonXKhau/ngoaiTe"/></td>
                <td align="right" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(HoaDonXKhau/dongVietNam) and (HoaDonXKhau/dongVietNam!='') and (HoaDonXKhau/dongVietNam!=0)"><xsl:value-of select="format-number(HoaDonXKhau/dongVietNam,'#.##0,####;(#.##0,####)','vndong')"/></xsl:when>
                    <xsl:when test="(HoaDonXKhau/dongVietNam) and (HoaDonXKhau/dongVietNam!='') and (HoaDonXKhau/dongVietNam=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
              
                <td align="center" class="borderTD_note"><xsl:value-of select="CTuTToanNganHang/so"/></td>
                <td align="center" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(CTuTToanNganHang/ngay) and (CTuTToanNganHang/ngay!='')"><xsl:value-of select="concat(substring(CTuTToanNganHang/ngay,9,2),'/',substring(CTuTToanNganHang/ngay,6,2),'/',substring(CTuTToanNganHang/ngay,1,4))"/></xsl:when>
                    <xsl:otherwise><div style="display:inline-block; margin:0px 40px;">&nbsp;</div></xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="right" class="borderTD_note"><xsl:value-of select="CTuTToanNganHang/ngoaiTe"/></td>
                <td align="right" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(CTuTToanNganHang/dongVietNam) and (CTuTToanNganHang/dongVietNam!='') and (CTuTToanNganHang/dongVietNam!=0)"><xsl:value-of select="format-number(CTuTToanNganHang/dongVietNam,'#.##0,####;(#.##0,####)','vndong')"/></xsl:when>
                    <xsl:when test="(CTuTToanNganHang/dongVietNam) and (CTuTToanNganHang/dongVietNam!='') and (CTuTToanNganHang/dongVietNam=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
            
                <td align="center" class="borderTD_note"><xsl:value-of select="ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/so"/></td>
                <td align="center" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/ngay) and (ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/ngay!='')"><xsl:value-of select="concat(substring(ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/ngay,9,2),'/',substring(ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/ngay,6,2),'/',substring(ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/ngay,1,4))"/></xsl:when>
                    <xsl:otherwise><div style="display:inline-block; margin:0px 40px;">&nbsp;</div></xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="right" class="borderTD_note"><xsl:value-of select="ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/ngoaiTe"/></td>
                <td align="right" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/dongVietNam) and (ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/dongVietNam!='') and (ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/dongVietNam!=0)"><xsl:value-of select="format-number(ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/dongVietNam,'#.##0,####;(#.##0,####)','vndong')"/></xsl:when>
                    <xsl:when test="(ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/dongVietNam) and (ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/dongVietNam!='') and (ChungTuThanhToanBuTru/VBanXNhanVoiNNgoai/dongVietNam=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
            
                <td align="center" class="borderTD_note"><xsl:value-of select="ChungTuThanhToanBuTru/HDongNhapKhau/so"/></td>
                <td align="center" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ChungTuThanhToanBuTru/HDongNhapKhau/ngay) and (ChungTuThanhToanBuTru/HDongNhapKhau/ngay!='')"><xsl:value-of select="concat(substring(ChungTuThanhToanBuTru/HDongNhapKhau/ngay,9,2),'/',substring(ChungTuThanhToanBuTru/HDongNhapKhau/ngay,6,2),'/',substring(ChungTuThanhToanBuTru/HDongNhapKhau/ngay,1,4))"/></xsl:when>
                    <xsl:otherwise><div style="display:inline-block; margin:0px 40px;">&nbsp;</div></xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="right" class="borderTD_note"><xsl:value-of select="ChungTuThanhToanBuTru/HDongNhapKhau/ngoaiTe"/></td>
                <td align="right" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ChungTuThanhToanBuTru/HDongNhapKhau/dongVietNam) and (ChungTuThanhToanBuTru/HDongNhapKhau/dongVietNam!='') and (ChungTuThanhToanBuTru/HDongNhapKhau/dongVietNam!=0)"><xsl:value-of select="format-number(ChungTuThanhToanBuTru/HDongNhapKhau/dongVietNam,'#.##0,####;(#.##0,####)','vndong')"/></xsl:when>
                    <xsl:when test="(ChungTuThanhToanBuTru/HDongNhapKhau/dongVietNam) and (ChungTuThanhToanBuTru/HDongNhapKhau/dongVietNam!='') and (ChungTuThanhToanBuTru/HDongNhapKhau/dongVietNam=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
            
                <td align="center" class="borderTD_note"><xsl:value-of select="ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/soTKhai"/></td>
                <td align="center" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/ngayDKyTKhai) and (ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/ngayDKyTKhai!='')"><xsl:value-of select="concat(substring(ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/ngayDKyTKhai,9,2),'/',substring(ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/ngayDKyTKhai,6,2),'/',substring(ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/ngayDKyTKhai,1,4))"/></xsl:when>
                    <xsl:otherwise><div style="display:inline-block; margin:0px 40px;">&nbsp;</div></xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
                <td align="right" class="borderTD_note"><xsl:value-of select="ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/ngoaiTe"/></td>
                <td align="right" class="borderTD_note"><xsl:choose>
                    <xsl:when test="(ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/dongVietNam) and (ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/dongVietNam!='') and (ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/dongVietNam!=0)"><xsl:value-of select="format-number(ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/dongVietNam,'#.##0,####;(#.##0,####)','vndong')"/></xsl:when>
                    <xsl:when test="(ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/dongVietNam) and (ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/dongVietNam!='') and (ChungTuThanhToanBuTru/ToKhaiHHoaNhapKhau/dongVietNam=0)">0</xsl:when>
                    <xsl:otherwise>&nbsp;</xsl:otherwise>
                  </xsl:choose>&nbsp;</td>
              
                <td align="left" class="borderTD"><xsl:value-of select="ChungTuThanhToanBuTru/chungTuThanhToanBuTruKhac"/></td>
                
                <td align="left" class="borderTD"><xsl:value-of select="ghiChu"/></td>
              </tr>
              </xsl:for-each>
            </table>

            <!-- Thông tin Tổng cộng -->
            <table>
              <tr>
                <td width="10%">&nbsp;</td>
                <td align="left" valign="middle">
                  Các tài liệu khác (nếu có): <xsl:value-of select="HSoKhaiThue/PLuc/PL01_3_GTGT/taiLieuKhac"/>
                </td>
                <td width="10%">&nbsp;</td>
              </tr>
            </table>

            <!-- Thông tin Cam kết -->
            <xsl:copy-of select="$CamKetPhuLuc"/>
            <br />
  
            <!-- Thông tin NV ĐLT và CKS -->
            <xsl:copy-of select="$CKS"/>
            
            <!-- Ghi chú -->
            <table>
              <tr>
                <td align="justify" valign="middle" style="font-size:13px; border-top:1px solid #000">
                  <i><b><u>Ghi chú:</u></b>
                  <br />
                  - Cột &ldquo;Tờ khai số&rdquo; ghi đầy đủ chữ số và ký hiệu của Tờ khai hàng hoá xuất khẩu, nhập khẩu.
                  <br />
                  - Cột &ldquo;Ngày đăng ký&rdquo; ghi rõ ngày tháng năm đăng ký Tờ khai hàng hoá xuất nhập khẩu.
                  <br />
                  - Cột &ldquo;Ngoại tệ&rdquo; ghi rõ số tiền và đồng tiền thanh toán đối với ngoại tệ; cột &ldquo;Đồng Việt Nam&rdquo; ghi rõ số tiền thanh toán nếu đồng tiền thanh toán là Đồng Việt Nam (trường hợp trên tài liệu có ghi cả hai đồng tiền thanh toán là ngoại tệ và Đồng Việt Nam thì phải ghi vào cả 2 cột này).
                  <br />
                  - Trường hợp người nộp thuế xuất khẩu hàng hoá để thực hiện công trình xây dựng ở nước ngoài thì cột &ldquo;Hợp đồng xuất khẩu&rdquo; ghi Văn bản ban hành Danh mục hàng hoá xuất khẩu để xây dựng công trình ở nước ngoài.
                   </i>
                </td>
              </tr>
            </table>
          </td></tr></table>
        </xsl:if>

        <!-- PL01_4A_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_4A_GTGT) and (HSoKhaiThue/PLuc/PL01_4A_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          
          </td></tr></table>
        </xsl:if>

        <!-- PL01_4B_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_4B_GTGT) and (HSoKhaiThue/PLuc/PL01_4B_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          
          </td></tr></table>
        </xsl:if>

        <!-- PL01_5_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_5_GTGT) and (HSoKhaiThue/PLuc/PL01_5_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          
          </td></tr></table>
        </xsl:if>

        <!-- PL01_6_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_6_GTGT) and (HSoKhaiThue/PLuc/PL01_6_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          
          </td></tr></table>
        </xsl:if>

        <!-- PL01_7_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL01_7_GTGT) and (HSoKhaiThue/PLuc/PL01_7_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          
          </td></tr></table>
        </xsl:if>

        <!-- PL_01_1_TD_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL_01_1_TD_GTGT) and (HSoKhaiThue/PLuc/PL_01_1_TD_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          
          </td></tr></table>
        </xsl:if>

        <!-- PL_01_2_TD_GTGT -->
        <xsl:if test="(HSoKhaiThue/PLuc/PL_01_2_TD_GTGT) and (HSoKhaiThue/PLuc/PL_01_2_TD_GTGT!='')">
          <div class="pagebreak"><br class="pagebreak" /></div>
          <table class="pagePortrait" align="center" style="table-layout:auto"><tr><td>
          
          </td></tr></table>
        </xsl:if>
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
            số 119/2014/TT-BTC ngày<br />
            25/08/2014 của Bộ Tài chính)</i>
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
            số 119/2014/TT-BTC ngày<br />
            25/08/2014 của Bộ Tài chính)</i>
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
            số 119/2014/TT-BTC ngày<br />
            25/08/2014 của Bộ Tài chính)</i>
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
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy) and (/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kieuKy='Y')"><b>[01]</b> Kỳ tính thuế: Năm <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/KyKKhaiThue/kyKKhai"/></xsl:when>
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
          <b>[04] Tên người nộp thuế: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenNNT"/></b>
        </td>
      </tr>
      <tr>
        <td colspan="4" align="left" valign="middle">
          <b>[05]</b> Mã số thuế: 
          <span style="margin-left:50px;">&nbsp;</span>
          <xsl:choose>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst)=10)">
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
            </xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst)=13)">
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,11,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,12,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,13,1)"/></span>
            </xsl:when>
            <xsl:when test="(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst) and (string-length(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst)=14)">
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,1,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,2,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,3,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,4,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,5,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,6,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,7,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,8,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,9,1)"/></span>
              <span class="cell cellformat" style="margin:0 2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,10,1)"/></span>
              -
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,12,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,13,1)"/></span>
              <span class="cell cellformat" style="margin-left:2px"><xsl:value-of select="substring(/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/mst,14,1)"/></span>
            </xsl:when>
            <xsl:otherwise>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin:0 2px">&nbsp;</span>
              -
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
              <span class="cell cellformat" style="margin-left:2px">&nbsp;</span>
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
          <i>Đơn vị tiền: đồng Việt Nam</i>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin Chi tiết tờ khai chính -->
  <xsl:variable name="TTChiTietTKhaiChinh">
    <xsl:for-each select="/HSoThueDTu/HSoKhaiThue/CTieuTKhaiChinh[1]">
    <table cellpadding="2" cellspacing="0" style="font-size:12px">
      <col width="5%"/>
      <col width="55%"/>
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
        <td align="right" class="borderTD"><b>
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
        <td align="right" class="borderTD">
          <xsl:choose>
            <xsl:when test="(GiaTriVaThueGTGTHHDVMuaVao/ct23) and (GiaTriVaThueGTGTHHDVMuaVao/ct23!='') and (GiaTriVaThueGTGTHHDVMuaVao/ct23!=0)"><xsl:value-of select="format-number(GiaTriVaThueGTGTHHDVMuaVao/ct23, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(GiaTriVaThueGTGTHHDVMuaVao/ct23) and (GiaTriVaThueGTGTHHDVMuaVao/ct23!='') and (GiaTriVaThueGTGTHHDVMuaVao/ct23=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[24]</b></td>
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="left" class="borderTD">Hàng hóa, dịch vụ bán ra chịu thuế GTGT ([27]=[29]+[30]+[32]; [28]=[31]+[33])</td>
        <td align="center" class="borderTD"><b>[27]</b></td>
        <td align="right" class="borderTD">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuThueGTGT/ct27) and (HHDVBRaChiuThueGTGT/ct27!='') and (HHDVBRaChiuThueGTGT/ct27!=0)"><xsl:value-of select="format-number(HHDVBRaChiuThueGTGT/ct27, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuThueGTGT/ct27) and (HHDVBRaChiuThueGTGT/ct27!='') and (HHDVBRaChiuThueGTGT/ct27=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[28]</b></td>
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuTSuat5/ct30) and (HHDVBRaChiuTSuat5/ct30!='') and (HHDVBRaChiuTSuat5/ct30!=0)"><xsl:value-of select="format-number(HHDVBRaChiuTSuat5/ct30, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuTSuat5/ct30) and (HHDVBRaChiuTSuat5/ct30!='') and (HHDVBRaChiuTSuat5/ct30=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[31]</b></td>
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct32) and (HHDVBRaChiuTSuat10/ct32!='') and (HHDVBRaChiuTSuat10/ct32!=0)"><xsl:value-of select="format-number(HHDVBRaChiuTSuat10/ct32, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct32) and (HHDVBRaChiuTSuat10/ct32!='') and (HHDVBRaChiuTSuat10/ct32=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[33]</b></td>
        <td align="right" class="borderTD">
          <xsl:choose>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct33) and (HHDVBRaChiuTSuat10/ct33!='') and (HHDVBRaChiuTSuat10/ct33!=0)"><xsl:value-of select="format-number(HHDVBRaChiuTSuat10/ct33, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(HHDVBRaChiuTSuat10/ct33) and (HHDVBRaChiuTSuat10/ct33!='') and (HHDVBRaChiuTSuat10/ct33=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td align="center" class="borderTD"><b>3</b></td>
        <td align="left" class="borderTD">Tổng doanh thu và thuế GTGT của HHDV bán ra ([34]=[26]+[27]; [35]=[28])</td>
        <td align="center" class="borderTD"><b>[34]</b></td>
        <td align="right" class="borderTD">
          <xsl:choose>
            <xsl:when test="(TongDThuVaThueGTGTHHDVBRa/ct34) and (TongDThuVaThueGTGTHHDVBRa/ct34!='') and (TongDThuVaThueGTGTHHDVBRa/ct34!=0)"><xsl:value-of select="format-number(TongDThuVaThueGTGTHHDVBRa/ct34, '#.##0,####;(#.##0,####)', 'vndong')"/></xsl:when>
            <xsl:when test="(TongDThuVaThueGTGTHHDVBRa/ct34) and (TongDThuVaThueGTGTHHDVBRa/ct34!='') and (TongDThuVaThueGTGTHHDVBRa/ct34=0)">0</xsl:when>
            <xsl:otherwise>&nbsp;</xsl:otherwise>
          </xsl:choose>
        </td>
        <td align="center" class="borderTD"><b>[35]</b></td>
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
        <td align="right" class="borderTD">
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
      <xsl:if test="not(/HSoThueDTu/TTCKYS/TTCKY) or (/HSoThueDTu/TTCKYS/TTCKY)=''">
      <tr><td colspan="4">&nbsp;</td></tr>
      <tr><td colspan="4">&nbsp;</td></tr>
      </xsl:if>
      <xsl:if test="(/HSoThueDTu/TTCKYS/TTCKY) and (/HSoThueDTu/TTCKYS/TTCKY)!=''">
      <tr>
        <xsl:for-each select="/HSoThueDTu/TTCKYS/TTCKY[2]">
        <td colspan="2" align="center" valign="middle" style="height:72px; white-space:nowrap; font-size:12px; background-image: url('data:image/png;base64,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'); background-repeat:no-repeat; background-position:center;;">
          Signer Info: <xsl:value-of select="SI"/><br/>
          Serial number: <xsl:value-of select="SN"/><br/>
          Signing Time: <xsl:value-of select="ST"/>
        </td>
        </xsl:for-each>
        <td>&nbsp;</td>
        <xsl:for-each select="/HSoThueDTu/TTCKYS/TTCKY[1]">
        <td align="center" valign="middle" style="height:72px; white-space:nowrap; font-size:12px; background-image: url('data:image/png;base64,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'); background-repeat:no-repeat; background-position:center;;">
          Signer Info: <xsl:value-of select="SI"/><br/>
          Serial number: <xsl:value-of select="SN"/><br/>
          Signing Time: <xsl:value-of select="ST"/>
        </td>
        </xsl:for-each>
      </tr>
      </xsl:if>
      <tr><td colspan="4">&nbsp;</td></tr>
      <tr>
        <td colspan="3">&nbsp;</td>
        <td  align="center" valign="middle">
          <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/TKhaiThue/nguoiKy"/>
        </td>   
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin NNT phụ lục -->
  <xsl:variable name="NNTPhuLuc">
    <table>
      <col width="10%" />
      <col width="22%" />
      <col width="10%" />
      <col width="10%" />
      <col width="38%" />
      <col width="10%" />
      <tr><td colspan="6">&nbsp;</td></tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="4" align="left" valign="top">
          <b>[02] Tên người nộp thuế: <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/NNT/tenNNT"/></b>
        </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="4" align="left" valign="middle">
          <b>[03]</b> Mã số thuế: 
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
        <td>&nbsp;</td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin ĐLT phụ lục -->
  <xsl:variable name="DLTPhuLuc">
    <table>
      <col width="10%" />
      <col width="22%" />
      <col width="10%" />
      <col width="10%" />
      <col width="38%" />
      <col width="10%" />
      <tr><td colspan="6">&nbsp;</td></tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="4" align="left" valign="top">
          <b>[04] Tên đại lý thuế (nếu có): <xsl:value-of select="/HSoThueDTu/HSoKhaiThue/TTinChung/TTinTKhaiThue/DLyThue/tenDLyThue"/></b>
        </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="4" align="left" valign="middle">
          <b>[05]</b> Mã số thuế: 
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
        <td>&nbsp;</td>
      </tr>
      <!-- Thông tin Đơn vị tiền -->
      <tr>
        <td colspan="6" align="right" valign="bottom">
          <i>Đơn vị tiền: đồng Việt Nam</i>
        </td>
      </tr>
    </table>
  </xsl:variable>

  <!-- Đưa vào Thông tin Cam kết phụ lục -->
  <xsl:variable name="CamKetPhuLuc">
    <table>
      <tr>
        <td width="10%">&nbsp;</td>
        <td colspan="2" align="left" valign="middle">
          Tôi cam đoan số liệu khai trên là đúng và chịu trách nhiệm trước pháp luật về số liệu đã khai ./.		
        </td>
        <td width="10%">&nbsp;</td>
      </tr>
    </table>
  </xsl:variable>
</xsl:stylesheet>