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
					 margin-top="5mm" margin-bottom="5mm" margin-left="5mm" margint-right="5mm">
					 <fo:region-body margin-top="20mm" margin-bottom="15mm"/>
					 <fo:region-before extent="20mm"/>
					</fo:simple-page-master>				
				</fo:layout-master-set>	

				<xsl:for-each select="Item">
					<fo:page-sequence master-reference="A4">
						





					</fo:page-sequence>
				</xsl:for-each>


			</fo:root>
    </xsl:template>
</xsl:stylesheet>