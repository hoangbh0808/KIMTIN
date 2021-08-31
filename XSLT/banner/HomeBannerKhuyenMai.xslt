<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/BannerList">
		<section class="section sec-banner">
			<div class="container">
				<div class="row">
					<xsl:apply-templates select="Banner"></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="col-lg-4 col-md-4 col-sm-6 ">
			<div class="banner-item">
				<div class="img">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>