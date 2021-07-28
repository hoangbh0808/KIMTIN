<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<div class="side-navigation-wrapper">
			<div class="title">
				<h1>
					<xsl:apply-templates select="Zone" mode="Title"></xsl:apply-templates>
				</h1>
			</div>
			<ul class="side-navigation">
				<xsl:apply-templates select="Zone"></xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Title">
		<xsl:if test="IsActive='true'">
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="IsActive='true'">
			<xsl:apply-templates select="Zone" mode='Sub'></xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Sub">
		<li class="navigation-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>navigation-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="count(Zone) &gt; 0">
					<div class="accordion-title">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</a>
						<div class="icon">
							<span></span>
							<span></span>
						</div>
					</div>
					<ul class="nav-sub">
						<xsl:apply-templates select="Zone" mode="sub-2"></xsl:apply-templates>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<div class="accordion-title">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</a>
						<div class="icon">
							<span></span>
							<span></span>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="sub-2">
		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
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