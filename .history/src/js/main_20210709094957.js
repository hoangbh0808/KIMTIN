/*==================== SHOW SCROLL TOP ====================*/
const scrollTop = () => {
	let bannerHeight = $("#banner-home").outerHeight();
	let pageBanner = $("#page-banner").outerHeight();
	$(window).scroll(function () {
		if (
			$(this).scrollTop() > bannerHeight ||
			$(this).scrollTop() > pageBanner
		) {
			$("#site-tool").addClass("active");
		} else {
			$("#site-tool").removeClass("active");
		}
	});

	$("#scroll-top").on("click", function (e) {
		e.preventDefault();
		$("html,body").animate({
			scrollTop: 0,
		});
	});
};
/*==================== MAIN MENU MOBILE ====================*/
const mainMenu = () => {
	$(".btn-toggle").on("click", () => {
		let $this = $(".btn-toggle");
		$this.toggleClass("active");
		$("#overlay").toggleClass("active");
		$(".nav-main .navbar").toggleClass("active");
	});
	$("#overlay").on("click", function () {
		let $this = $(this);
		$this.removeClass("active");
		$(".btn-toggle").removeClass("active");
		$(".nav-main .navbar").removeClass("active");
	});
	$(".btn-toggle-search").on("click", function () {
		$(this).siblings(".search-box").slideToggle();
	});
};

/*==========LISTBANNER SLIDER==========*/
const initBanner = () => {
	let myswiper = new Swiper(".banner-hero  .swiper-container", {
		loop: false,
		speed: 2500,
		effect: "fade",
		grabCursor: true,
		autoplay: {
			delay: 5000,
			disableOnInteraction: false,
		},
		fadeEffect: {
			crossFade: true,
		},
		pagination: {
			el: ".banner-hero  .swiper-pagination",
			clickable: true,
			type: "bullets",
		},
	});
	$(".wrapper-slide  .swiper-container").each(function (index, element) {
		var $this = $(this);
		$this.addClass("instance-" + index);
		$this
			.parent()
			.find(".swiper-button-prev")
			.addClass("swiper-button-prev-" + index);
		$this
			.parent()
			.find(".swiper-button-next")
			.addClass("swiper-button-next-" + index);

		var swiper = new Swiper(".instance-" + index, {
			speed: 750,
			observer: true,
			observeParents: true,
			lazy: true,
			breakpointsInverse: true,
			loop: false,
			navigation: {
				nextEl: ".swiper-button-next-" + index,
				prevEl: ".swiper-button-prev-" + index,
			},
			breakpoints: {
				320: {
					slidesPerView: 2,
					spaceBetween: 10,
				},
				768: {
					spaceBetween: 13,
					slidesPerView: 3,
				},
				1025: {
					spaceBetween: 13,
					slidesPerView: 4,
				},
				1200: {
					spaceBetween: 13,
					slidesPerView: 5,
				},
			},
		});
	});
	// Product Detail
	// var productDetailThumbs = new Swiper(
	// 	".san-pham-ct .thumbnail-product .swiper-container",
	// 	{
	// 		slidesPerView: 3,
	// 		spaceBetween: 5,
	// 		speed: 1000,
	// 		observer: true,
	// 		observeParents: true,
	// 		slidesPerColumnFill: "row",
	// 		direction: "horizontal",
	// 		breakpoints: {
	// 			414: {
	// 				slidesPerView: 3,
	// 			},
	// 			768: {
	// 				direction: "vertical",
	// 				slidesPerView: 4,
	// 			},
	// 		},
	// 	}
	// );
	// var productDetailTop = new Swiper(
	// 	".san-pham-ct .img-main-product .swiper-container",
	// 	{
	// 		slidesPerView: 1,
	// 		spaceBetween: 10,
	// 		observer: true,
	// 		observeParents: true,
	// 		speed: 1000,
	// 		slidesPerColumnFill: "row",
	// 		navigation: {
	// 			nextEl: ".san-pham-ct .wrap-main-product .button-next",
	// 			prevEl: ".san-pham-ct .wrap-main-product .button-prev",
	// 		},
	// 		thumbs: {
	// 			swiper: productDetailThumbs,
	// 		},
	// 	}
	// );
	var productDetailTop = new Swiper(".page-dau-thau .swiper-container", {
		slidesPerView: 1,
		observer: true,
		observeParents: true,
		speed: 1000,
		navigation: {
			nextEl: ".page-dau-thau .button-next",
			prevEl: ".page-dau-thau .button-prev",
		},
		breakpoints: {
			414: {
				slidesPerView: 2,
			},
			768: {
				slidesPerView: 3,
			},
			1024: {
				slidesPerView: 4,
			},
		},
	});
};
// ===========================CHECK BANNER========================= //
const checkLayoutBanner = () => {
	const pagesBanner = $("#pagebanner");
	const heightHeader = $("header").outerHeight();
	const mainBanner = $("#home-banner");
	if (mainBanner.length >= 1) {
		$("main").css("padding-top", 0);
	} else if (pagesBanner.length >= 1) {
		$("main").css("padding-top", heightHeader);
	} else {
		$("main").css("padding-top", heightHeader);
	}
};
// =========================== BUTTON SEARCH MOBILE =========================== //
const searchButton = () => {
	$(".search-box .button-search").on("click", () => {
		let $this = $(".search-box .button-search");
		$this.siblings(".form-group ").slideToggle();
	});
};
// =========================SET BACKGROUND ====================================== //
const setBackgroundElement = () => {
	$("[setBackground]").each(function () {
		var background = $(this).attr("setBackground");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-size": "cover",
			"background-position": "center center",
			"background-repeat": "repeat",
		});
	});
};

// ======================== MAPPING ============================================//
const mappingInit = () => {
	$(".wrap-right .hotline").mapping({
		mobileWrapper: ".wrap-right .toggle-button .sub-toggle",
		mobileMethod: "appendTo",
		desktopWrapper: "header nav .header-top .nav-main .wrap-right",
		desktopMethod: "appento",
		breakpoint: 1200,
	});
	$(".wrap-right .promotion").mapping({
		mobileWrapper: ".wrap-right .toggle-button .sub-toggle",
		mobileMethod: "appendTo",
		desktopWrapper: ".wrap-right",
		desktopMethod: "appento",
		breakpoint: 1200,
	});
	$(".header-bottom .wrapper-button").mapping({
		mobileWrapper: ".wrap-right .toggle-button .sub-toggle",
		mobileMethod: "appendTo",
		desktopWrapper: ".header-bottom",
		desktopMethod: "appento",
		breakpoint: 1200,
	});

	$("header")
		.find(".toggle-button .icon")
		.on("click", function () {
			$(this).next().slideToggle();
			$(this).toggleClass("active");
		});
};
/*==================== Button Amount Product ====================*/
function adjustProductAmount() {
	$(".btn-dec").click(function (e) {
		e.preventDefault();
		let amountInput = $(this).next();
		let amountVal = parseInt(amountInput.val());
		if (amountVal <= 0) {
			amountVal = 0;
		} else {
			amountVal--;
		}
		amountInput.val(amountVal);
		$(".amount").trigger("change");
	});

	$(".btn-inc").click(function (e) {
		e.preventDefault();
		let amountInput = $(this).prev();
		let amountVal = parseInt(amountInput.val());
		amountVal++;
		amountInput.val(amountVal);
		$(".amount").trigger("change");
	});
}

// ========================SCROLL HEADER ACTIVE ================================ //
const headerScrollActive = () => {
	var lastScrollTop = 0;
	$(window).scroll(function (event) {
		var checkScroll = $(this).scrollTop();
		if (checkScroll > lastScrollTop) {
			$("header").addClass("active");
		} else {
			$("header").removeClass("active");
		}
		lastScrollTop = checkScroll;
	});
};
/*==================== Responsive height produtct ====================*/
function responeProduct() {
	let parent = $(".san-pham-ct.dung-cu-cam-tay");
	let height = parent.find(".wrap-content-product").outerHeight();
	let imgProdctThum = parent.find(".thumbnail-product");
	let imgMainSlide = parent.find(".img-main-product");
	if ($(window).width() > 1200) {
		imgProdctThum.css("height", height);
		imgMainSlide.css("height", height);
	}
}
/*==================== Dropdown Product ====================*/
const DropdownProduct = () => {
	$(".san-pham-ct .wrap-other-product").append(
		'<div class="loading-search"><svg id="load" x="0px" y="0px" viewBox="0 0 150 150"><circle id="loading-inner" cx="75" cy="75" r="60"/></svg></div>'
	);
	var $parent = $(".san-pham-ct"),
		$items = $parent.find(".item-product-other"),
		$loadMoreButton = $parent.find(".showItem"),
		maxItems = 2,
		numberItems = 2;
	var hiddenClass = "visually-hidden";
	$.each($items, function (idx, item) {
		if (idx > numberItems - 1) {
			$(this).addClass(hiddenClass);
		}
	});
	$loadMoreButton.on("click", function (e) {
		$(".loading-search").addClass("active");
		setTimeout(() => {
			$(".loading-search").removeClass("active");
		}, 250);
		setTimeout(() => {
			$("." + hiddenClass).each(function (idx, item) {
				if (idx < maxItems) {
					$(this).removeClass(hiddenClass);
				}
				if ($("." + hiddenClass).length === 0) {
					$loadMoreButton.hide();
				}
			});
		}, 300);
	});
};
const DropdownProductLang = () => {
	$(".count-product-10 .wrap-flex-product").append(
		'<div class="loading-search"><svg id="load" x="0px" y="0px" viewBox="0 0 150 150"><circle id="loading-inner" cx="75" cy="75" r="60"/></svg></div>'
	);
	var $parent = $(".count-product-10"),
		$items = $parent.find(".col-product"),
		$loadMoreButton = $parent.find(".showItem"),
		maxItems = 5,
		numberItems = 10;
	var hiddenClass = "visually-hidden";
	$.each($items, function (idx, item) {
		if (idx > numberItems - 1) {
			$(this).addClass(hiddenClass);
		}
	});
	$loadMoreButton.on("click", function (e) {
		$(".loading-search").addClass("active");
		setTimeout(() => {
			$(".loading-search").removeClass("active");
		}, 250);
		setTimeout(() => {
			$("." + hiddenClass).each(function (idx, item) {
				if (idx < maxItems) {
					$(this).removeClass(hiddenClass);
				}
				if ($("." + hiddenClass).length === 0) {
					$loadMoreButton.hide();
				}
			});
		}, 300);
	});
};
const DropdownProductLang2 = () => {
	$(".count-product-15 .wrap-flex-product").append(
		'<div class="loading-search"><svg id="load" x="0px" y="0px" viewBox="0 0 150 150"><circle id="loading-inner" cx="75" cy="75" r="60"/></svg></div>'
	);
	var $parent = $(".count-product-15"),
		$items = $parent.find(".col-product"),
		$loadMoreButton = $parent.find(".showItem"),
		maxItems = 5,
		numberItems = 15;
	let CountProduct = $items.length;
	console.log(CountProduct);
	if (CountProduct <= numberItems) {
		$loadMoreButton.hide();
	}
	var hiddenClass = "visually-hidden";
	$.each($items, function (idx, item) {
		if (idx > numberItems - 1) {
			$(this).addClass(hiddenClass);
		}
	});

	$loadMoreButton.on("click", function (e) {
		$(".loading-search").addClass("active");
		setTimeout(() => {
			$(".loading-search").removeClass("active");
		}, 250);
		setTimeout(() => {
			$("." + hiddenClass).each(function (idx, item) {
				if (idx < maxItems) {
					$(this).removeClass(hiddenClass);
				}
				if ($("." + hiddenClass).length === 0) {
					$loadMoreButton.hide();
				}
			});
		}, 300);
	});
};
/*====================  ====================*/
const accordianList = () => {
	$(".accordion-title .icon").on("click", function (e) {
		let $this = $(this);
		e.preventDefault();
		if ($this.parent().next().hasClass("show")) {
			$this.parent().next().removeClass("show");
			$this.parent().next().slideUp(350);
			$this.closest("li").removeClass("active");
		} else {
			$this.parent().parents().find(".nav-sub").removeClass("show");
			$this.parent().parents().find(".nav-sub").slideUp(350);
			$this.closest(".side-navigation").find("li").removeClass("active");
			$this.parent().next().toggleClass("show");
			$this.parent().next().slideDown(350);
			$this.closest("li").addClass("active");
		}
	});
	if ($(".side-navigation li").hasClass("active")) {
		$(".side-navigation li.active").find(".nav-sub").slideDown(350);
	}
	$("body").on("click", ".filter-wrapper .title", function () {
		$(this).toggleClass("active");
		$(this).next().slideToggle();
	});
	$("body").on("click", ".side-navigation-wrapper .title", function () {
		$(this).toggleClass("active");
		$(this).next().slideToggle();
		$(".side-navigation-wrapper .title").not(this).next().slideUp();
		$(".side-navigation-wrapper .title").not(this).removeClass("active");
	});
};
/*==================== tabContent ====================*/
function tabContent(params) {
	$(".tabslet-tab .box-tab").on("click", function () {
		let id = $(this).attr("data-id");
		$(".tabslet-content").removeClass("active");
		$("#" + id).addClass("active");
	});
}
/*==================== Tab Đấu thầu ====================*/
function tabDauThau(e) {
	$(".box-tab").on("click", function () {
		$(".page-dau-thau").find(".box-tab").not(this).removeClass("active");
		$(this).addClass("active");
	});
}
/*==================== Điều chỉnh input ====================*/
function EditInputForm() {
	$(".subscribebutton").text("Gửi");
}
/*==================== Dropdown Sản phẩm nổi bật ====================*/
const DropdownProductHome = () => {
	$(".home-specail").append(
		'<div class="loading-search"><svg id="load" x="0px" y="0px" viewBox="0 0 150 150"><circle id="loading-inner" cx="75" cy="75" r="60"/></svg></div>'
	);
	var $parent = $(".home-specail"),
		$items = $parent.find(".col-6"),
		$loadMoreButton = $parent.find(".btn-defaul"),
		maxItems = 4,
		numberItems = 8;
	var hiddenClass = "visually-hidden";
	$.each($items, function (idx, item) {
		if (idx > numberItems - 1) {
			$(this).addClass(hiddenClass);
		}
	});
	$loadMoreButton.on("click", function (e) {
		$(".loading-search").addClass("active");
		setTimeout(() => {
			$(".loading-search").removeClass("active");
		}, 250);
		setTimeout(() => {
			$("." + hiddenClass).each(function (idx, item) {
				if (idx < maxItems) {
					$(this).removeClass(hiddenClass);
				}
				if ($("." + hiddenClass).length === 0) {
					$loadMoreButton.hide();
				}
			});
		}, 300);
	});
};
/*==================== For Cart ====================*/
function clickAddress() {
	$(".click-more-address").click(function () {
		$(this).toggleClass("active");
		$(".user-info").slideToggle();
	});
}
function clickTriggerCart() {
	$(".san-pham-ct .add-to-cart").on("click", function () {
		if ($(".shopping-cart-wrapper").is(".active")) {
		} else {
			$(".wrap-cart-icon").trigger("click");
		}
	});
}
/*==================== ClickFilterProduct ====================*/
function ClickFilterProduct(e) {
	$(".button-dmsp").click(function () {
		if ($(".wrap-filter-wraper").is(".active")) {
			$(".button-blsp").trigger("click");
		}
		$(".side-navigation-wrapper").toggleClass("active");
		var text = $(this).text();
		$(this).text(
			text == "Danh mục sản phẩm"
				? "Đóng danh mục sản phẩm"
				: "Danh mục sản phẩm"
		);
	});
	$(".button-blsp").click(function () {
		if ($(".side-navigation-wrapper").is(".active")) {
			$(".button-dmsp").trigger("click");
		}
		$(".wrap-filter-wraper").toggleClass("active");
		var text = $(this).text();
		$(this).text(
			text == "Bộ lọc sản phẩm"
				? "Đóng bộ lọc sản phẩm"
				: "Bộ lọc sản phẩm"
		);
	});
}
/*==================== Phan trang ====================*/
function phantrang() {
	$(".modulepager")
		.find(".pagination")
		.find("li>a.NextPage, li>a.LastPage, li>a.BackPage, li>a.FirstPage")
		.parent()
		.hide();
	$(".pagination").appendTo(".hero-product");
}
/*==================== ButtonToTOp ====================*/
function buttonToTop() {
	$(".button-to-top").click(function () {
		$("html, body").animate(
			{
				scrollTop: 0,
			},
			300
		);
	});
}
/*==================== User Infomation ====================*/
function FillColorLogin(e) {
	if ($(".profile-container").length == 1) {
		$("main").css("background-color", "#f8f8f8");
	}
}
const checkDiaChi = () => {
	$(".profile-container .address-info .type").each(function () {
		console.log($(this).text());
		if (!$(this).text().trim()) {
			$(this).text("Phụ");
		} else {
			$(this).css("background-color", "#000000");
		}
	});
};
const InsertMobileAccount = () => {
	$(
		'<div class="button-account-profile"><p class="title-main">Thông tin tài khoản</p> <em class="ri-arrow-down-s-line"></em></div>'
	).insertBefore(".user-sidelink");
	if ($(window).width() < 1024) {
		$(".button-account-profile").click(function () {
			$(this).toggleClass("active");
			$(".user-sidelink").toggleClass("active");
		});
	}
};
/*==================== Check width home-choose  ====================*/
function checkWidthHomeChoose() {
	$('.home-choose ul li .count').each(function () {
		let width = $(this).css('width') + 10;
		console.log('width' + width)
	})
}
/*==================== Check active filer ====================*/
function checkActiveFilter() {
	$(".filter-wrapper").each(function () {
		let count = $(this).find(".ajaxlink.active").length;
		if (count >= 1) {
			$(this).find(".filter-option").slideDown();
			$(this).find(".filter-option").addClass("active");
		} else {
			$(this).find(".filter-option").slideUp();
		}
	});
}
/*==================== Count Number ====================*/
function counter() {
	$(".home-choose .count").countUp();
}
/*==================== LOAD FUNCTION ====================*/
$(document).ready(function () {
	AOS.init();
	scrollTop();
	mainMenu();
	initBanner();
	searchButton();
	setBackgroundElement();
	mappingInit();
	if ($(window).width() < 768) {
		headerScrollActive();
	}
	accordianList();
	// For Page Product
	// adjustProductAmount();
	setTimeout(() => {
		responeProduct();
	}, 300);
	DropdownProduct();
	DropdownProductLang();
	DropdownProductLang2();
	tabContent();
	tabDauThau();
	EditInputForm();
	// For Home
	DropdownProductHome();
	counter()
	// For Cart
	clickAddress();
	clickTriggerCart();
	checkLayoutBanner();
	$(document).click(function (e) {
		var container = $(".suggestsearch");
		if (!container.is(e.target) && container.has(e.target).length === 0) {
			container.hide();
		}
	});
	// For List Product
	ClickFilterProduct();
	phantrang();
	// Main
	buttonToTop();
	// Click when after ajax
	$("header").on("click", ".wrap-cart-icon", function () {
		$(".shopping-cart-wrapper").toggleClass("active");
	});
	FillColorLogin();
	checkDiaChi();
	InsertMobileAccount();
	checkActiveFilter();
	checkWidthHomeChoose();
});
