<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/LanguageList">
		<div class="language">
			<div class="dropdown">
				<a href="javascript:;">
					<xsl:apply-templates select="Language[IsActive='true']" mode="Active"></xsl:apply-templates>
				</a>
				<ul class="dropdown-menu">
					<xsl:apply-templates select="Language[IsActive='false']" mode="Not_Active"></xsl:apply-templates>
				</ul>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Language" mode="Active">
		<a href="javascript:;">
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			<em class="ri-arrow-down-s-line"></em>
		</a>
	</xsl:template>
	<xsl:template match="Language" mode="Not_Active">
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>