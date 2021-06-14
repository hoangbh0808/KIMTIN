<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<section class="page-khuyen-mai section">
			<div class="container">
				<h1 class="title-page center">
					<xsl:value-of disable-output-escaping="yes" select="ZoneTitle"></xsl:value-of>
				</h1>
				<div class="wrap-km-1">
					<div class="box-img zoom-img">
						<div class="img">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="News[1]/Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="News[1]/Title"></xsl:value-of>
								</xsl:attribute>
								<img class="lazyload">
									<xsl:attribute name="data-src">
										<xsl:value-of select="News[1]/ImageUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="News[1]/Title"></xsl:value-of>
									</xsl:attribute>
								</img>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="content">
							<h2 class="title f-24 fw-700 hover-title">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="News[1]/Url"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="News[1]/Title"></xsl:value-of>
									</xsl:attribute>
									<xsl:value-of disable-output-escaping="yes" select="News[1]/Title"></xsl:value-of>
								</a>
								<xsl:value-of select="News[1]/EditLink" disable-output-escaping="yes"></xsl:value-of>
							</h2>
							<div class="desc f-16">
								<xsl:value-of disable-output-escaping="yes" select="News[1]/BriefContent"></xsl:value-of>
							</div>
						</div>
						<div class="wrap-date-link">
							<div class="date-post">
								<xsl:value-of disable-output-escaping="yes" select="News[1]/CreatedDate"></xsl:value-of>
							</div>
							<a class="link">
								<xsl:attribute name="href">
									<xsl:value-of select="News[1]/Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="News[1]/Title"></xsl:value-of>
								</xsl:attribute>
								<em class="lnr lnr-arrow-right"></em>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="wrap-post-list-km">
			<div class="container">
				<div class="row">
					<xsl:apply-templates select="News"></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-4 col-sm-6">
			<div class="box-post-item zoom-img">
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
				<div class="wrap-content">
					<div class="content">
						<h3 class="title-post">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</a>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h3>
						<p class="desc-post">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</p>
					</div>
					<div class="wrap-date-link">
						<div class="date-post">
							<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
						</div>
						<a class="link">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<em class="lnr lnr-arrow-right"></em>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>