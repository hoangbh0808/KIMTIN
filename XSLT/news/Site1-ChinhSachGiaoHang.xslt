<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsDetail">
		<section class="khuyen-mai-detail">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="wrap-content-main">
							<div class="wrap-head-title">
								<h1 class="title-post">
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h1>
								<div class="wrap-date-social">
									<div class="date-post">
										<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
									</div>
									<div class="social-wrap">
										<div class="fb-like" data-width="150" data-layout="button" data-action="like"
									data-size="small" data-share="true">
											<xsl:attribute name="data-href">
												<xsl:value-of select="FullUrl" />
											</xsl:attribute>
										</div>
									</div>
								</div>
							</div>
							<div class="content-main">
								<div class="content-head">
									<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
								</div>
								<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
</xsl:stylesheet>