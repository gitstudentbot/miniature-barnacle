<?xml version="1.1" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- =========================================================== -->
<!-- Root                                                        -->
<!-- =========================================================== -->
    <xsl:template match="Sales">
			<fo:root font-size="9pt" font-family="IPA Gothic, IPAGothic">
				<fo:layout-master-set>
					<fo:simple-page-master master-name="A4" page-width="297mm" page-height="210mm"
					 margin-top="5mm" margin-bottom="5mm" margin-left="10mm" margin-right="10mm">
					 <fo:region-body margin-top="30mm" margin-bottom="15mm"/>
					 <fo:region-before extent="20mm"/>
					</fo:simple-page-master>				
				</fo:layout-master-set>	

				<xsl:for-each select="Item">
					<fo:page-sequence master-reference="A4">
						<!--ヘッダー header-->
						<fo:static-content flow-name="xsl-region-before">
							<fo:block text-align="center" font-size="22pt" margin-top="10mm">求 人 管 理 簿</fo:block>
							
							<!--Logo-->
							<fo:block-container absolute-position="absolute">
								<fo:block text-align="right" margin-right="2mm">
									<fo:external-graphic src="logo.png" content-height="scale-down-to-fit" 
									content-width="scale-down-to-fit" height="20mm" width="50mm"/>
								</fo:block>
							</fo:block-container>
						</fo:static-content>


						<!--本文 Main-->
						<fo:flow flow-name="xsl-region-body">

							<fo:block>
								<fo:inline-container width="50%" text-align="left">
									<fo:block>
										<xsl:value-of select="Sales.U_B12B28FC7D8021A3DFC49AE7F59D15"/>
									</fo:block>
								</fo:inline-container>
								<fo:inline-container width="50%" text-align="right">
									<fo:block>
										【有効期間の終了後２年間保存】
									</fo:block>
								</fo:inline-container>
							</fo:block>

							<fo:table table-layout="fixed" margin-top="1mm" border="1pt solid">
								<fo:table-column column-number="1" column-width="10mm"/>
								<fo:table-column column-number="2" column-width="15mm"/>
								<fo:table-column column-number="3" column-width="45mm"/>
								<fo:table-column column-number="4" column-width="15mm"/>
								<fo:table-column column-number="5" column-width="60mm"/>
								<fo:table-body>
									
								</fo:table-body>
								
								
								
								
							</fo:table>
						</fo:flow>
					</fo:page-sequence>
				</xsl:for-each>
			</fo:root>
    </xsl:template>
</xsl:stylesheet>