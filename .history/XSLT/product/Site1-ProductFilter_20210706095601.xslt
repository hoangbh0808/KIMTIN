<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductFilter">
		<div class="wrap-filter-wraper">
			<div class="ajaxfilterresponse">
				<xsl:apply-templates select="Group"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Group">
		<div class="filter-wrapper">
			<div class="title">
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				<div class="icon">
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="filter-option">
				<ul>
					<xsl:apply-templates select="Option"></xsl:apply-templates>
				</ul>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Option">
		<li  class="checkbox">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text></xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a class="ajaxlink">
				<xsl:choose>
					<xsl:when test="IsActive='true'">
						<xsl:attribute name="class">
							<xsl:text disable-output-escaping="yes">ajaxlink active</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:value-of select="ClearUrl" disable-output-escaping="yes"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="class">
							<xsl:text disable-output-escaping="yes">ajaxlink</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"/>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="DisplayName"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>