<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/DealerList">
        <input type="hidden" id="hdnDealerLocatorSiteId">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/SiteId"></xsl:value-of>
        </xsl:attribute>
        </input>
        <input type="hidden" id="hdnDealerLocatorLanguageId">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/LanguageId"></xsl:value-of>
        </xsl:attribute>
        </input>
        <input type="hidden" id="hdnDealerLocatorZoneGuid" value="">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/ZoneGuid"></xsl:value-of>
        </xsl:attribute>
        </input>
        <input type="hidden" id="hdfDealerLocatorSelectCountry">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/SelectCountryText"></xsl:value-of>
        </xsl:attribute>
        </input>
        <input type="hidden" id="hdfDealerLocatorSelectProvince">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
        </xsl:attribute>
        </input>
        <input type="hidden" id="hdfDealerLocatorSelectDistrict">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
        </xsl:attribute>
        </input>
        <input type="hidden" id="hdfDealerLocatorSelectZone">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/SelectZoneText"></xsl:value-of>
        </xsl:attribute>
        </input>
        <input type="hidden" id="hdfDealerLocatorCulture">
        <xsl:attribute name="value">
            <xsl:value-of select="/DealerList/Culture"></xsl:value-of>
        </xsl:attribute>
        </input>

        <h1 class="block-title text-center">
            <xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
        </h1>
        <div class="map-wrapper">
            <div class="map-filter">
                <div class="wrap-filter d-flex aic">
                    <div class="title text-3 f-14 fw-6 text-upp">
                        <xsl:text disable-output-escaping="yes">Tìm kiếm cửa hàng</xsl:text>
                    </div>
                    <div class="filter-field">
                        <div class="field form_desc section-group" style="display:none;">
                            <select id="ddlCountry"></select>
                        </div>
                        <select id="ddlProvince">
							<option value="">
								<xsl:value-of select="/DealerList/SelectProvinceText">
								</xsl:value-of>
							</option>
						</select>
                    </div>
                    <div class="filter-field">
                        <select id="ddlDistrict">
							<option value="">
								<xsl:value-of select="/DealerList/SelectDistrictText">
								</xsl:value-of>
							</option>
						</select>

                    </div>
                    <div class="filter-button">
                        <div class="button">
                            <input type="submit" id="edit-submit">
                            <xsl:attribute name="value">
                                <xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
                            </xsl:attribute>
                            </input>
                        </div>
                        <div class="mt-3 hidden">
                            <input type="submit" id="edit-submit" class="btn-searchmap">
                            <xsl:attribute name="value">
                                <xsl:value-of select="/DealerList/SearchText" />
                            </xsl:attribute>
                            </input>
                        </div>
                        <div class="hidden">
                            <div class="search-text">
                                <label>
									<xsl:value-of select="/DealerList/OrText" />
								</label>
                                <input type="text" maxlength="128" name="address" id="address" size="60" value="" class="form-text" autocomplete="off">
                                <xsl:attribute name="placeholder">
                                    <xsl:value-of select="/DealerList/EnterLocationText" />
                                </xsl:attribute>
                                </input>
                                <input type="submit" id="edit-submit" class="btn btn-large btn-primary">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="/DealerList/SearchText" />
                                </xsl:attribute>
                                </input>
                            </div>
                        </div>
                        <div id="direction" class="find_address" style="display:none;">
                            <div class="row mrb10">
                                <div class="col-sm-2">
                                    <strong>
										<xsl:value-of select="/DealerList/FromText" />
									</strong>
                                </div>
                                <div class="col-sm-10">
                                    <input id="origin-direction" name="origin-direction" class="orides-txt" type="text" />
                                </div>
                            </div>
                            <div class="row mrb20">
                                <div class="col-sm-2">
                                    <strong>
										<xsl:value-of select="/DealerList/ToText" />
									</strong>
                                </div>
                                <div class="col-sm-10">
                                    <input id="dest-direction" name="dest-direction" class="orides-txt" type="text" />
                                </div>
                            </div>
                            <div id="get-dir-button" class="get-dir-button">
                                <input type="submit" id="get-direction" class="btn">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="/DealerList/FindText" />
                                </xsl:attribute>
                                </input>
                                <a href="javascript:directionBack()">
                                    <xsl:value-of select="/DealerList/BackText" />
                                </a>
                            </div>
                            <div class="overlay" id="overlay-contact-clinic-form">
                                <div class="form-wrapper">
                                </div>
                            </div>
                        </div>
                        <div class="overlay" id="overlay-contact-clinic-form">
                            <div class="form-wrapper">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hidden">
                <div class="searh-text">
                    <label>
						<xsl:value-of select="/DealerList/OrText"></xsl:value-of>
					</label>
                    <input type="text" maxlength="128" name="address" id="address" size="60" value="" class="form-text" autocomplete="off">
                    <xsl:attribute name="placeholder">
                        <xsl:value-of select="/DealerList/EnterLocationText"></xsl:value-of>
                    </xsl:attribute>
                    </input>
                    <input type="submit" id="edit-submit" class="btn btn-large btn-primary">
                    <xsl:attribute name="value">
                        <xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
                    </xsl:attribute>
                    </input>
                </div>
            </div>
            <div class="map-column">
                <div class="d-flex wrapper">
                    <div class="box-left">
                        <ul class="ls-none p-0" id="list">

                        </ul>
                    </div>
                    <div class="box-right">
                        <div class="map-frame">
                            <iframe id='location-iframe' src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.146549740628!2d106.66254231535628!3d10.800085761708441!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175292fdf3852d7%3A0x73983207ff803cfd!2zMjUzIEhvw6BuZyBWxINuIFRo4bulLCBQaMaw4budbmcgMiwgVMOibiBCw6xuaCwgSOG7kyBDaMOtIE1pbmgsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1582884305953!5m2!1sen!2s"
                                width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                            <input type="hidden" id="distance" name="distance" value="1" />
                            <div id="map_canvas" class="map_system hidden">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>