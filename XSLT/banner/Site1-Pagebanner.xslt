<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/BannerList">
		<xsl:apply-templates select="Banner"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Banner">
		<section id="page-banner">
			<div class="banner__pages">
				<img >
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<xsl:if test="Description!=''">
				<div class="box-text-banner">
					<div class="text">
						<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
					</div>
					<a class="btn btn-yellow">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<span>Xem ngay</span>
						<em class="lnr lnr-arrow-right"></em>
					</a>
				</div>
			</xsl:if>
		</section>
	</xsl:template>
</xsl:stylesheet>