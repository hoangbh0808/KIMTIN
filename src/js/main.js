/*==================== SHOW SCROLL TOP ====================*/
const scrollTop = () => {
	let headerHeight = $("header").outerHeight();
	let bannerHeight = $("#section-banner").outerHeight();
	$(window).scroll(function () {
		if ($(this).scrollTop() > headerHeight) {
			$("#scroll-top").addClass("show-scroll");
		} else {
			$("#scroll-top").removeClass("show-scroll");
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
			loop: true,
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
	var productDetailThumbs = new Swiper(
		".san-pham-ct .thumbnail-product .swiper-container",
		{
			slidesPerView: 3,
			spaceBetween: 5,
			speed: 1000,
			observer: true,
			observeParents: true,
			slidesPerColumnFill: "row",
			direction: "horizontal",
			breakpoints: {
				414: {
					slidesPerView: 3,
				},
				768: {
					direction: "vertical",
					slidesPerView: 4,
				},
			},
		}
	);
	var productDetailTop = new Swiper(
		".san-pham-ct .img-main-product .swiper-container",
		{
			slidesPerView: 1,
			spaceBetween: 10,
			observer: true,
			observeParents: true,
			speed: 1000,
			slidesPerColumnFill: "row",
			navigation: {
				nextEl: ".san-pham-ct .wrap-main-product .button-next",
				prevEl: ".san-pham-ct .wrap-main-product .button-prev",
			},
			thumbs: {
				swiper: productDetailThumbs,
			},
		}
	);
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
	let bannerHeight = $("#banner-home").outerHeight();
	let pageBanner = $("#page-banner").outerHeight();
	$(window).scroll(function () {
		if (
			$(this).scrollTop() > bannerHeight ||
			$(this).scrollTop() > pageBanner
		) {
			$("header").addClass("show__scroll");
			$("header").slideDown();
		} else if ($(this).scrollTop() > 0) {
			$("header").slideUp();
		} else {
			$("header").removeClass("show__scroll");
			$("header").slideDown();
		}
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
		'<div class="loading"><svg id="load" x="0px" y="0px" viewBox="0 0 150 150"><circle id="loading-inner" cx="75" cy="75" r="60"/></svg></div>'
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
		$(".loading").addClass("active");
		setTimeout(() => {
			$(".loading").removeClass("active");
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
	$(".page-langding .wrap-flex-product").append(
		'<div class="loading"><svg id="load" x="0px" y="0px" viewBox="0 0 150 150"><circle id="loading-inner" cx="75" cy="75" r="60"/></svg></div>'
	);
	var $parent = $(".page-langding"),
		$items = $parent.find(".product-item"),
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
		$(".loading").addClass("active");
		setTimeout(() => {
			$(".loading").removeClass("active");
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
			$this.parents("li").removeClass("active");
		} else {
			$this.parent().parents().find(".nav-sub").removeClass("show");
			$this.parent().parents().find(".nav-sub").slideUp(350);
			$this.parent().parents().find("li").removeClass("active");
			$this.parent().next().toggleClass("show");
			$this.parent().next().slideDown(350);
			$this.parents("li").addClass("active");
		}
	});
	if ($(".side-navigation li").hasClass("active")) {
		$(".side-navigation li.active").find(".nav-sub").slideDown(350);
	}
	$(".filter-wrapper .title").on("click", function () {
		$(this).toggleClass("active");
		$(this).next().slideToggle();
		$(".filter-wrapper .title").not(this).next().slideUp();
		$(".filter-wrapper .title").not(this).removeClass("active");
	});
	$(".side-navigation-wrapper .title").on("click", function () {
		$(this).toggleClass("active");
		$(this).next().slideToggle();
		$(".side-navigation-wrapper .title").not(this).next().slideUp();
		$(".side-navigation-wrapper .title").not(this).removeClass("active");
	});
};
/*==================== LOAD FUNCTION ====================*/
$(document).ready(function () {
	// scrollTop();
	mainMenu();
	initBanner();
	searchButton();
	setBackgroundElement();
	mappingInit();
	headerScrollActive();
	accordianList();
	// For Page Product
	adjustProductAmount();
	setTimeout(() => {
		responeProduct();
	}, 300);
	DropdownProduct();
	DropdownProductLang();
});
