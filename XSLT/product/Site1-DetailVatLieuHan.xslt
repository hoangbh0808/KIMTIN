<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductDetail">
		<section class="san-pham-ct vat-lieu-han main-css-image">
			<div class="container">
				<div class="wrap-main-product">
					<div class="wrap-img-product border-right">
						<div class="thumbnail-product">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="ProductImages" mode="Thumb"></xsl:apply-templates>
								</div>
								<div class="wrap-button">
									<div class="button-prev">
										<em class="lnr lnr-arrow-up"></em>
									</div>
									<div class="button-next">
										<em class="lnr lnr-arrow-down"></em>
									</div>
								</div>
							</div>
						</div>
						<div class="img-main-product">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="ProductImages" mode="ImgMain"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
					<div class="wrap-content-product padding-content">
						<h1 class="title-product-main lh-8">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<div class="wrap-price">
							<ins class="main-price">
								<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
							</ins>
							<del class="sale-price">
								<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
							</del>
						</div>
						<div class="donvi color-text f-14 fw-400">
							<xsl:text disable-output-escaping="yes">ĐVT: </xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="ProductProperties/Options/Title"></xsl:value-of>
						</div>
						<div class="content-main">
							<div class="sku">SKU:
								<xsl:value-of disable-output-escaping="yes" select="ProductId">
												</xsl:value-of>
							</div>
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</div>
						<div class="wrap-select-input">
							<span>Quy cách</span>
							<ul>
								<li>
									<input type="radio" id="quycach1" name="quycach"/>
									<label for="quycach1">Ø 3.2</label>
								</li>
								<li>
									<input type="radio" id="quycach2" name="quycach"/>
									<label for="quycach2">Ø 4.0</label>
								</li>
								<li>
									<input type="radio" id="quycach3" name="quycach"/>
									<label for="quycach3">Ø 4.0</label>
								</li>
							</ul>
						</div>
						<div class="wrap-number-order mt-19">
							<span>Số lượng</span>
							<div class="input-amount">
								<a class="btn-dec" href="javascript:;"></a>
								<input class="amount" type="text" value="1" name="">
									<xsl:attribute name="name">
										<xsl:text>addtocart_</xsl:text>
										<xsl:value-of select="ProductId" disable-output-escaping="yes" />
										<xsl:text>.EnteredQuantity</xsl:text>
									</xsl:attribute>
								</input>
								<a class="btn-inc" href="javascript:;"></a>
							</div>
						</div>
						<div class="wrap-button-buy mt-19">
							<a class="btn add-to-cart" onclick="AjaxCart.addproducttocart_details(this); return false;">
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId"></xsl:value-of>
								</xsl:attribute>
								<xsl:text disable-output-escaping="yes">Thêm vào giỏ hàng</xsl:text>
							</a>
							<a class="btn buy-now" href="">Mua ngay</a>
						</div>
						<div class="wrap-share mt">
							<div class="wishlist-warp">
								<a class='add-to-wishlist add-favorites' onclick="AjaxCart.addproducttowishlist(this);return false;">
									<xsl:attribute name="data-productid">
										<xsl:value-of select="ProductId"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="href">
										<xsl:text>javascript:;</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when test="AddedWishList = 'True'">
											<em class="ri-heart-fill"></em>
										</xsl:when>
										<xsl:otherwise>
											<em class="ri-heart-line"></em>
										</xsl:otherwise>
									</xsl:choose>
								</a>
							</div>
							<a class="like-facebook">
								<xsl:attribute name="href">
									<xsl:text disable-output-escaping="yes">https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="FullUrl"></xsl:value-of>
								</xsl:attribute>
								<em class="fab fa-facebook-f"></em>
							</a>
						</div>
					</div>
				</div>
				<div class="wrap-desc-product">
					<div class="row">
						<div class="col-lg-9">
							<div class="wrap-box-left">
								<div class="tab-desc-product">
									<xsl:apply-templates select="ProductAttributes"></xsl:apply-templates>
								</div>
								<div class="box-comment-facebook">
									<div class="head">
										<div class="title-page">Bình luận sản phẩm</div>
									</div>
									<div class="facebook-comment">
										<div class="fb-comments" data-width="100%" data-numposts="5">
											<xsl:attribute name="data-href">
												<xsl:value-of disable-output-escaping="yes" select="FullUrl"></xsl:value-of>
											</xsl:attribute>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<xsl:if test="count(ProductOther) &gt; 0">
								<div class="wrap-other-product">
									<div class="title-other-product color-text f-18 fw-700 text-uppercase">Cùng danh mục</div>
									<div class="wrap-item">
										<xsl:apply-templates select="ProductOther"></xsl:apply-templates>
									</div>
								</div>
								<div class="button d-flex justify-center mt-20">
									<div class="btn btn-defaul showItem">
										<span>Xem thêm</span>
										<em class="lnr lnr-plus-circle"></em>
									</div>
								</div>
							</xsl:if>
						</div>
					</div>
				</div>
			</div>
		</section>
		<xsl:if test="count(ProductRelated) &gt; 0">
			<section class="section home-product bg-grey">
				<div class="container">
					<div class="section-title">Sản phẩm liên quan</div>
					<div class="wrapper-slide">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductRelated"></xsl:apply-templates>
							</div>
							<div class="wrap-button">
								<div class="swiper-button-next"></div>
								<div class="swiper-button-prev"></div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="count(ProductViewed) &gt; 0">
			<section class="section home-product bg-grey">
				<div class="container">
					<div class="section-title">
					Sản phẩm đã xem
				</div>
					<div class="wrapper-slide">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductViewed"></xsl:apply-templates>
							</div>
						</div>
						<div class="wrap-button">
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ProductImages" mode="Thumb">
		<div class="swiper-slide">
			<div class="wrap-img">
				<div class="img">
					<img >
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductImages" mode="ImgMain">
		<div class="swiper-slide">
			<a>
				<xsl:attribute name="data-fancybox">
					<xsl:text disable-output-escaping="yes"></xsl:text>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<img >
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="ProductAttributes">
		<div class="title-tab-product">
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</div>
		<div class="content-product">
			<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
		</div>
	</xsl:template>
	<xsl:template match="ProductOther">
		<div class="item-product-other zoom-img">
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
				<a class="title">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</a>
				<div class="wrap-price">
					<ins>
						<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
					</ins>
					<del>
						<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
					</del>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductRelated">
		<div class="swiper-slide">
			<div class="swiper-inner">
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
				<div class="caption">
					<div class="title">
						<a href="">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</a>
					</div>
					<div class="wraper-price d-flex aligin-center">
						<span class="price">
							<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
						</span>
						<span class="oldprice">
							<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
						</span>
					</div>
				</div>
				<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
					<div class="option yellow">
						<div class="desc">Mới</div>
					</div>
				</xsl:if>
				<xsl:if test="DiscountPercentage!=''">
					<div class="option red">
						<div class="desc">
							<xsl:text disable-output-escaping="yes">-</xsl:text>
							<xsl:value-of select="DiscountPercentage"></xsl:value-of>
							<xsl:text disable-output-escaping="yes">%</xsl:text>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductViewed">
		<div class="swiper-slide">
			<div class="swiper-inner">
				<div class="img">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="caption">
					<div class="title">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</a>
					</div>
					<div class="wraper-price d-flex aligin-center">
						<span class="price">
							<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
						</span>
						<span class="oldprice">
							<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
						</span>
					</div>
				</div>
				<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
					<div class="option yellow">
						<div class="desc">Mới</div>
					</div>
				</xsl:if>
				<xsl:if test="DiscountPercentage!=''">
					<div class="option red">
						<div class="desc">
							<xsl:text disable-output-escaping="yes">-</xsl:text>
							<xsl:value-of select="DiscountPercentage"></xsl:value-of>
							<xsl:text disable-output-escaping="yes">%</xsl:text>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>