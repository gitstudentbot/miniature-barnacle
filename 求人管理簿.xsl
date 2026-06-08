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
					 <fo:region-body margin-top="30mm" margin-bottom="0mm"/>
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
										<xsl:value-of select="Sales.U_329EF86EC8EC8534AD35E8EE04633B"/>
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
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-top="1.5pt solid" border-right="0.8pt solid" border-left="0.8pt solid" number-rows-spanned="4">
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
																	<xsl:value-of select="Sales.P_Recruiter/Recruiter/Recruiter.P_Street"/>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Job/Job/Job.U_357A3EFEBC41DBEB7CC3BAFEC669BB"/>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	就業場所
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.U_5F6205D6E345C341A21FBA1E36B5C6"/>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>

														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	担当者
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Owner"/>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	④求人数
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<!--セル内をテーブルにして上下分割する-->
																<fo:table table-layout="fixed" width="100%">
																	<fo:table-body>
																		<!--上半分-->
																		<fo:table-row height="7.5mm">
																			<fo:table-cell display-align="center" border-bottom="0.8pt solid">
																				<fo:block text-align="center">
																					賃金形態
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																		<!--下半分-->
																		<fo:table-row height="7.5mm">
																			<fo:table-cell display-align="center">
																				<fo:block text-align="center">
																					賃金額
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																	</fo:table-body>
																</fo:table>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:table table-layout="fixed" width="100%">
																	<fo:table-body>
																		<!--上半分-->
																		<fo:table-row height="7.5mm">
																			<fo:table-cell display-align="center" border-bottom="0.8pt solid">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.P_Job/Job/Job.U_33C689376BEC4DDAF1E973C4CE97A1"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																		<fo:table-row height="7.5mm">
																			<!--下半分-->
																			<fo:table-cell display-align="center">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.P_Job/Job/Job.U_D904C42164777C8EB307DB20B2B0AC"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																	</fo:table-body>
																</fo:table>
															</fo:table-cell>
														</fo:table-row>

														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	電話番号
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Recruiter/Recruiter/Recruiter.U_BD0048DB7ABE843ED936D49CB186EB"/>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Job/Job/Job.U_86C5F632AAED0FBE9B5F3B54F2CEF5"/>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	雇用形態
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Job/Job/Job.P_EmploymentType"/>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>

														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-bottom="1.5pt solid" border-top="1.5pt solid" number-columns-spanned="3">
																<fo:block text-align="center">
																	⑥職業紹介の取扱状況
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-bottom="1.5pt solid" border-top="1.5pt solid" number-columns-spanned="2">
																<fo:block text-align="center">
																	⑦無期雇用就業者に関する事項等
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" border-bottom="1.5pt solid" border-top="1.5pt solid">
																<fo:block text-align="center">
																	⑧備考
																</fo:block>
															</fo:table-cell>
														</fo:table-row>

														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	紹介年月日
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" number-columns-spanned="2">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.U_E538E1626180614856ADE9D08F0552"/>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" number-columns-spanned="3" number-rows-spanned="5">
																<!--右下子テーブル child table-->
																<fo:table table-layout="fixed" width="100%">
																	<fo:table-column column-number="1" column-width="30mm"/>
																	<fo:table-column column-number="2" column-width="40mm"/>
																	<fo:table-column column-number="3" column-width="64mm"/>
																	<fo:table-body>
																		<fo:table-row height="7.5mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					無期雇用である旨
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_CA4F6B79F208433852C3B91A14C7BB"/>
																				</fo:block>
																			</fo:table-cell>
																		
																		</fo:table-row>

																		<fo:table-row height="22.5mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					転職勧奨
																				</fo:block>
																				<fo:block text-align="center">
																					禁止期間
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:if test="Sales.U_CA4F6B79F208433852C3B91A14C7BB = '○'">
																						<!--年月日の正規化-->
																						<xsl:variable name="datestr" select="Sales.U_0EB4A080A12912811EDE9ADFA9AD6F"/>
																						<xsl:variable name="year" select="substring($datestr, 1, 4)"/>
																						<xsl:variable name="month" select="substring($datestr, 6, 2)"/>
																						<xsl:variable name="day" select="substring($datestr, 9, 2)"/>
																						<!--＋２年ー１日の計算-->
																						<xsl:variable name="newyear" select="number($year) + 2"/>
																						<xsl:variable name="newday" select="number($day) - 1 "/>

																						<xsl:choose>
																							<!--日が０になる場合（元の日が１）は前月の末日に繰り下げる-->
																							<xsl:when test="$newday = 0">
																								<xsl:variable name="prevmonth" select="number($month) - 1"/>
																								<xsl:variable name="adyear">
																									<xsl:choose>
																										<xsl:when test="$prevmonth = 0">
																											<xsl:value-of select="$newyear - 1"/>
																										</xsl:when>
																										<xsl:otherwise>
																											<xsl:value-of select="$newyear"/>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:variable>

																								<xsl:variable name="admonth">
																									<xsl:choose>
																										<xsl:when test="$prevmonth = 0">
																											12
																										</xsl:when>
																										<xsl:otherwise>
																											<xsl:value-of select="$prevmonth"/>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:variable>
																								
																								<!--各月の末日を正規化-->
																								<xsl:variable name="lastday">
																									<xsl:choose>
																										<xsl:when test="$admonth=1 or $admonth=3 or $admonth=5 or $admonth=7 or $admonth=8 or $admonth=10 or $admonth=12">
																											31
																										</xsl:when>
																										<xsl:when test="$admonth=4 or $admonth=6 or $admonth=9 or $admonth=11">
																											30
																										</xsl:when>
																										<xsl:when test="$admonth=2">
																											<xsl:choose>
																												<xsl:when test="($adyear mod 4 = 0 and $adyear mod 100 != 0) or $adyear mod 400 = 0">
																													29
																												</xsl:when>
																												<xsl:otherwise>
																													28
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:when>
																									</xsl:choose>
																								</xsl:variable>

																								<xsl:value-of select="$adyear"/>
																								<xsl:text>年</xsl:text>
																								<xsl:value-of select="format-number($admonth, '00')"/>
																								<xsl:text>月</xsl:text>
																								<xsl:value-of select="$lastday"/>
																								<xsl:text>日</xsl:text>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:value-of select="$newyear"/>
																								<xsl:text>年</xsl:text>
																								<xsl:value-of select="$month"/>
																								<xsl:text>月</xsl:text>
																								<xsl:value-of select="format-number($newday, '00')"/>
																								<xsl:text>日</xsl:text>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:if>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>

																		<fo:table-row height="7.5mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					6ヶ月後の離職状況
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_DFC5378E845756D45FA455995888D0"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																		
																		<fo:table-row height="7.5mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					調査日
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_93179391C625B751EAC8541AED35C6"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																		
																		<fo:table-row height="7.5mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					調査方法
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_58CFE82CBB287B4139F5808ED45CB1"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																		
																		<fo:table-row height="7.5mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					返戻金
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_3734D1C4545D592240C9EE547B06AA"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>

																	</fo:table-body>
																</fo:table>
															</fo:table-cell>
														</fo:table-row>




														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	求職者氏名
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" number-columns-spanned="2">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.P_Resume/Resume/Resume.P_Name"/>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>

														<fo:table-row height="7.5mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	顛末内容
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" number-columns-spanned="2">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.U_3EDE5A36BDE9707996E2FBAC9330F6"/>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>

														<fo:table-row height="15mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	採用年月日
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" number-columns-spanned="2">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.U_0EB4A080A12912811EDE9ADFA9AD6F"/>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>

														<fo:table-row height="7.5mm">
															<fo:table-cell xsl:use-attribute-sets="cell-base">
																<fo:block text-align="center">
																	雇用期間
																</fo:block>
															</fo:table-cell>
															<fo:table-cell xsl:use-attribute-sets="cell-base" number-columns-spanned="2">
																<fo:block text-align="center">
																	<xsl:value-of select="Sales.U_329EF86EC8EC8534AD35E8EE04633B"/>
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