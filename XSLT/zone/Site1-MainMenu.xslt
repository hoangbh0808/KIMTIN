<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<ul class="navbar d-flex align-center">
			<xsl:apply-templates select="Zone"></xsl:apply-templates>
		</ul>
	</xsl:template>
	<xsl:template match="Zone">
		<li class="nav-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>nav-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">nav-link</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</a>
			<xsl:if test="count(Zone) &gt; 0">
				<div class="dropdown-main-menu">
					<ul class="list-menu nav-1">
						<xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
					</ul>
				</div>
			</xsl:if>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone2">
		<li class="list-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>list-item active</xsl:text>
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
			<ul class="list-menu nav-2">
				<xsl:apply-templates select="Zone" mode="Zone3"></xsl:apply-templates>
			</ul>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone3">
		<li class="list-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>list-item active</xsl:text>
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