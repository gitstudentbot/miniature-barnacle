<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!--セルの正規化 standardize cell styles-->
<xsl:attribute-set name="cell-base">
	<xsl:attribute name="border">0.8pt solid black</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>

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
							
							<!--親テーブル parent table-->
							<fo:table table-layout="fixed" width="100%" margin-top="1mm" border="1.5pt solid">
								<fo:table-column column-number="1" column-width="18mm"/>
								<fo:table-column column-number="2" column-width="35mm"/>
								<fo:table-column column-number="3" column-width="90mm"/>
								<fo:table-column column-number="4" column-width="30mm"/>
								<fo:table-column column-number="5" column-width="104mm"/>
								<fo:table-body>
									<fo:table-row height="10mm">
										<fo:table-cell xsl:use-attribute-sets="cell-base" border-right="0.8pt solid">
											<fo:block text-align="center" line-height="10pt">求人整理</fo:block>
											<fo:block text-align="center" line-height="10pt">番号</fo:block>
										</fo:table-cell>
										
										<fo:table-cell xsl:use-attribute-sets="cell-base" border-right="0.8pt solid">
											<fo:block text-align="center">①受付年月日</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell-base" border-right="0.8pt solid">
											<fo:block text-align="center">②求人者の氏名又は名称・所在地・担当者・連絡先</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell-base" border-right="0.8pt solid">
											<fo:block text-align="center" line-height="10pt">有効期間</fo:block>
											<fo:block text-align="center" line-height="10pt">/求人数</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell-base">
											<fo:block text-align="center">⑤職種・就業場所・賃金形態・賃金額</fo:block>
										</fo:table-cell>
									</fo:table-row>
									
									<fo:table-row>
										<fo:table-cell xsl:use-attribute-sets="cell-base" border-left="1.5pt solid" border-top="1.5pt solid">
											<fo:block text-align="center">
												求人申込日
											</fo:block>
										</fo:table-cell>

										<!--子テーブル１ child table 1 (親テーブルの２行目２列目に格納)-->
										<fo:table-cell>
											<fo:block>
												<fo:table table-layout="fixed" width="125mm" border-collapse="collapse">
													<fo:table-column column-number="1" column-width="35mm"/>
													<fo:table-column column-number="2" column-width="20mm"/>
													<fo:table-column column-number="3" column-width="70mm"/>
													<fo:table-column column-number="4" column-width="30mm"/>
													<fo:table-column column-number="5" column-width="40mm"/>
													<fo:table-column column-number="6" column-width="64mm"/>
													<fo:table-body>
														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-top="1.5pt solid" border-right="0.8pt solid" border-left="0.8pt solid" number-rows-spanned="2">
																<fo:block text-align="center">
																	受付年月日
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-top="1.5pt solid" border-left="0.8pt solid">
																<fo:block text-align="center">
																	氏名/名称
																</fo:block>
															</fo:table-cell>
															<fo:table-cell display-align="center" border-top="1.5pt solid" border-left="0.8pt solid">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Recruiter/Recruiter/Recruiter.P_Name"/>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell display-align="center" border-top="1.5pt solid" border-left="0.8pt solid">
																<fo:block text-align="center">
																	③有効期間
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-top="1.5pt solid">
																<fo:block text-align="center">
																	職種
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-top="1.5pt solid">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Job/Job/Job.P_JobCategory"/>
																</fo:block>
															</fo:table-cell>									
														</fo:table-row>

														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	所在地
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Recruiter/Recruiter/Recruiter.P_PkmAddress"/>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>	
										</fo:table-cell>


									</fo:table-row>
								</fo:table-body>
							</fo:table>

						
										
										


									
										
										
										
										
										
										
							



						</fo:flow>
					</fo:page-sequence>
				</xsl:for-each>
			</fo:root>
    </xsl:template>
</xsl:stylesheet>