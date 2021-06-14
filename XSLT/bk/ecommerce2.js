var siteRoot = "";
$(document).ready(function() {
    /*************************************************************************************************************/
    /* BEGIN SEARCH
    /*************************************************************************************************************/
    //Search button
    $(".productsearchbox input[type='submit'],.productsearchbox button").click(
        function() {
            var container = $(this).parent();
            if ($(container).find(".suggestsearch ul li.selected").length) {
                var n = $(container)
                    .find(".suggestsearch ul li.selected")
                    .eq(0)
                    .children("a")
                    .attr("href");
                window.location = n;

                return false;
            }

            if ($(container).find("input[type='text']").val() == "") {
                $(container).find("input[type='text']").focus();
                return false;
            }
        }
    );

    //Search textbox
    $(".productsearchbox input[type='text']").keyup(function(n) {
        //        SuggestSearch(this, n);
        CallSuggest(this);
    });

    //    $(".productsearchbox input[type='text']").keydown(function () {
    //        CheckTimer();
    //    });

    var beginTime = 0,
        endTime = 0;

    function CheckTimer() {
        var n = new Date();
        beginTime == 0 && endTime == 0 && (beginTime = n.getTime());
        return;
    }

    function SuggestSearch(obj, n) {
        var i = new Date(),
            t;
        var suggestBoxItems = $(obj).parent().find(".suggestsearch ul");

        if (((endTime = i.getTime()), (beginTime = endTime), n.which == 40)) {
            //$(".productsearchbox .suggestsearch ul li.selected").length == 0 ? $(".productsearchbox .suggestsearch ul li:first").addClass("selected") : (t = $(".productsearchbox .suggestsearch ul li.selected").next(), t.hasClass("li-group") && (t = t.next()), $(".productsearchbox .suggestsearch ul li.selected").removeClass("selected"), t.addClass("selected"));
            $(suggestBoxItems).find(".selected").length == 0 ?
                $(suggestBoxItems).find("li").first().addClass("selected") :
                ((t = $(suggestBoxItems).find(".selected").next()),
                    t.hasClass("li-group") && (t = t.next()),
                    $(suggestBoxItems).find(".selected").removeClass("selected"),
                    t.addClass("selected"));
            return;
        }
        if (n.which == 38) {
            //$(".productsearchbox .suggestsearch ul li.selected").length == 0 ? $(".productsearchbox .suggestsearch ul li:last").addClass("selected") : (t = $(".productsearchbox .suggestsearch ul li.selected").prev(), t.hasClass("li-group") && (t = t.prev()), $(".productsearchbox .suggestsearch ul li.selected").removeClass("selected"), t.addClass("selected"));
            $(suggestBoxItems).find(".selected").length == 0 ?
                $(suggestBoxItems).find("li").last().addClass("selected") :
                ((t = $(suggestBoxItems).find(".selected").prev()),
                    t.hasClass("li-group") && (t = t.prev()),
                    $(suggestBoxItems).find(".selected").removeClass("selected"),
                    t.addClass("selected"));
            return;
        }

        SetTimeer(obj, 1);
    }

    function SetTimeer(obj, n) {
        setTimeout(function() {
            var i = new Date(),
                t = i.getTime();
            if (beginTime == endTime) {
                if (t - endTime < 750 && t - endTime >= 0) {
                    SetTimeer(obj, n);
                    return;
                }
                if (t - endTime >= 750) {
                    CallSuggest(obj);
                    return;
                }
            } else return;
        }, n);
    }

    function CallSuggest(obj) {
        var container = $(obj).parent();
        if (!$(container).find(".suggestsearch").length)
            $(container).append("<div class='suggestsearch'></div>");

        var suggestBox = $(container).find(".suggestsearch");

        var t = $(obj)
            .val()
            .replace(
                /:|;|!|@@|#|\$|%|\^|&|\*|'|"|>|<|,|\.|\?|\/|`|~|\+|=|_|\(|\)|{|}|\[|\]|\\|\|/gi,
                ""
            ),
            n = t.trim().toLowerCase();
        if (n.length < 2) {
            $(suggestBox).hide();
            return;
        }
        n.length >= 2 &&
            ($(obj).addClass("loading"),
                $.ajax({
                    url: siteRoot + "/Product/Services/SuggestSearch.ashx",
                    type: "GET",
                    dataType: "html",
                    data: {
                        q: n,
                    },
                    cache: !0,
                    success: function(data) {
                        $(obj).removeClass("loading");
                        data == "" || data == " " ?
                            $(suggestBox).hide() :
                            $(suggestBox).html(data).show();
                    },
                }));
    }

    var obp = $(".searchresults .productcount");
    if ($(obp).length) {
        $.get(
            siteRoot +
            "/Product/Services/SearchCountResult.ashx?q=" +
            $(obp).attr("keyword"),
            function(data) {
                $(obp).text(" (" + data + ")");
            }
        );
    }

    var obn = $(".searchresults .newscount");
    if ($(obn).length) {
        $.get(
            siteRoot +
            "/News/Services/SearchCountResult.ashx?q=" +
            $(obn).attr("keyword"),
            function(data) {
                $(obn).text(" (" + data + ")");
            }
        );
    }

    /*************************************************************************************************************/
    /* END SEARCH
    /*************************************************************************************************************/

    /*************************************************************************************************************/
    /* BEGIN FILTER
    /*************************************************************************************************************/

    /********Price filter ********/
    minprice = 0;
    maxprice = 10000000;
    initSlider();

    function initSlider() {
        if ($("#slider-range").length > 0) {
            minValue = 0;
            maxValue = 10000000;
            if ($(".pricemin").text().length)
                minValue = parseInt($(".pricemin").text());
            if ($(".pricemax").text().length)
                maxValue = parseInt($(".pricemax").text());

            var options = {
                range: true,
                step: 500000,
                min: 0,
                max: 10000000,
                values: [minValue, maxValue],
                slide: function(event, ui) {
                    $(".price-range .min-input").html(addCommas(ui.values[0]));
                    $(".price-range .max-input").html(addCommas(ui.values[1]));
                },
                change: function(event, ui) {
                    if (minprice == ui.values[0] && maxprice == ui.values[1]) {
                        // do nothing
                    } else {
                        minprice = ui.values[0];
                        maxprice = ui.values[1];
                        priceChange();
                    }
                },
            };

            $("#slider-range").slider(options);

            $(".price-range .min-input").html(
                addCommas($("#slider-range").slider("values", 0))
            );
            $(".price-range .max-input").html(
                addCommas($("#slider-range").slider("values", 1))
            );
        }
    }

    function addCommas(nStr) {
        nStr += "";
        x = nStr.split(".");
        x1 = x[0];
        x2 = x.length > 1 ? "." + x[1] : "";
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, "$1" + "." + "$2");
        }
        return x1 + x2;
    }

    function priceChange() {
        pageurl = $(".urlwithoutprice").attr("href");
        $.ajax({
            url: pageurl,
            data: { isajax: true, price: minprice + "-" + maxprice },
            success: function(data) {
                $(".ajaxresponse").html($(data).find(".ajaxresponse").html());
                $(".ajaxfilterresponse").html(
                    $(data).find(".ajaxfilterresponse").html()
                );
                $(".ajaxbrandresponse").html(
                    $(data).find(".ajaxbrandresponse").html()
                );
                $(".productpager").remove();
                $(data).find(".productpager").insertAfter($(".ajaxresponse"));

                pageurl = $(data).find(".urlwithprice").attr("href");
                //to change the browser URL to 'pageurl'
                if (pageurl != window.location) {
                    window.history.pushState({ path: pageurl }, "", pageurl);
                }
            },
        });
    }
    /********End Price filter ********/

    /********Reward points ********/
    initPointSlider();

    function initPointSlider() {
        var pointSlider = $("#pointSlider");
        if (pointSlider.length > 0) {
            var options = {
                range: false,
                step: pointSlider.data("step"),
                min: pointSlider.data("min"),
                max: pointSlider.data("max"),
                value: pointSlider.data("value"),
                slide: function(event, ui) {
                    $("#spendingPointsLabel").text(ui.value);
                    $("#spendingPoints").val(ui.value);
                },
                change: function(event, ui) {
                    var data = {
                        method: "SpendingPoint",
                        point: $("#spendingPoints").val(),
                    };
                    $.ajax({
                        cache: false,
                        url: siteRoot + "/Product/Services/CheckoutService.aspx",
                        data: data,
                        type: "post",
                        success: function(result) {
                            if (result.success) {
                                $(".discount-total").html(result.discountTotal);
                                $(".order-total").html(result.total);
                            } else alert(result.message);
                        },
                    });
                },
            };

            pointSlider.slider(options);
        }
    }
    /********End Reward points ********/

    /****************/
    / Ajax process /
    /****************/
    $("body").on("change", ".ajaxsort", function() {
        ProcessAjax($(this).val());
    });

    $("body").on("click", "a.ajaxlink", function(e) {
        e.preventDefault();
        /*
        if uncomment the above line, html5 nonsupported browers won't change the url but will display the ajax content;
        if commented, html5 nonsupported browers will reload the page to the specified link.
        */

        ProcessAjax($(this).attr("href"));

        //window.scrollTo(0, 0);
        if ($(this).parent().hasClass("reset_wrap")) initSlider();

        return false;
    });

    function ProcessAjax(pageurl) {
        //to get the ajax content and display in div with id 'content'
        $.ajax({
            url: pageurl,
            data: { isajax: true },
            success: function(data) {
                $(".ajaxresponse").html($(data).find(".ajaxresponse").html());

                $(".ajaxfilterresponse .option").html($(data).find(".ajaxfilterresponse .option").html());
                $(".ajaxfilterresponse .cate-item").each(function(){
                    $(this).find(".wrapper").html($(data).find(".ajaxfilterresponse .cate-item[data-id='"+$(this).data("id")+"'] .wrapper").html());
                });

                $(".ajaxbrandresponse").html($(data).find(".ajaxbrandresponse").html());
                $(".productpager").remove();
                $(data).find(".productpager").insertAfter($(".ajaxresponse"));
                ExpandRecruitItem();
            },
        });

        //to change the browser URL to 'pageurl'
        if (pageurl != window.location) {
            window.history.pushState({ path: pageurl }, "", pageurl);
        }
    }

    $("body").on("click", "a.ajaxpagerlink", function(e) {
        e.preventDefault();
        /*
        if uncomment the above line, html5 nonsupported browers won't change the url but will display the ajax content;
        if commented, html5 nonsupported browers will reload the page to the specified link.
        */

        //get the link location that was clicked
        obj = $(this);
        pageurl = $(this).attr("href");

        //to get the ajax content and display in div with id 'content'
        $.ajax({
            url: pageurl,
            data: { isajax: true },
            success: function(data) {
                $(".ajaxresponse .ajaxresponsewrap").append(
                    $(data).find(".ajaxresponsewrap").html()
                );
                obj.remove();
            },
        });

        //to change the browser URL to 'pageurl'
        if (pageurl != window.location) {
            window.history.pushState({ path: pageurl }, "", pageurl);
        }

        //window.scrollTo(0, 0);

        return false;
    });

    /* the below code is to override back button to get the ajax content without reload*/
    $(window).bind("popstate", function() {
        $.ajax({
            url: location.pathname,
            data: { isajax: true },
            success: function(data) {
                $(".ajaxresponse").html($(data).find(".ajaxresponse").html());
                $(".ajaxfilterresponse").html(
                    $(data).find(".ajaxfilterresponse").html()
                );
                $(".ajaxbrandresponse").html(
                    $(data).find(".ajaxbrandresponse").html()
                );
            },
        });
    });

    /*************************************************************************************************************/
    /* END FILTER
    /*************************************************************************************************************/

    if ($('input[name="ShippingMethod"]').length) {
        $('input[name="ShippingMethod"]').trigger("change");
    }
});

/*************************************************************************************************************/
/* BEGIN CART
/*************************************************************************************************************/

var AjaxCart = {
    loadWaiting: false,
    usepopupnotifications: false,
    effecttocart: true,
    topcartselector: ".cart .amount",
    topwishlistselector: "",
    flyoutcartselector: ".cartpanel",

    init: function(
        usepopupnotifications,
        topcartselector,
        topwishlistselector,
        flyoutcartselector
    ) {
        this.loadWaiting = false;
        this.usepopupnotifications = usepopupnotifications;
        this.topcartselector = topcartselector;
        this.topwishlistselector = topwishlistselector;
        this.flyoutcartselector = flyoutcartselector;
    },

    setLoadWaiting: function(display) {
        displayAjaxLoading(display);
        this.loadWaiting = display;
    },

    //add a product to the cart/wishlist from the catalog pages
    addproducttocart_catalog: function(button) {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        if (this.effecttocart == true && this.topcartselector) {
            var img = $(button).parent().parent().find(".product-img img");
            flyToCart($(img), this.topcartselector);
        }

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = {
            method: "AddProductToCart_Catalog",
            productid: $(button).attr("data-productid"),
        };
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: this.success_desktop,
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //add a product to the cart/wishlist from the product details page (desktop version)
    addproducttocart_details: function(button) {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        if (this.effecttocart == true && this.topcartselector) {
            var img = $(button)
                .parent()
                .parent()
                .parent()
                .find(".product-slide-wrap")
                .find(".product-img img");
            flyToCart($(img), this.topcartselector);
        }

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = $("#aspnetForm").serializeArray();
        data.push({ name: "method", value: "AddProductToCart_Details" });
        data.push({
            name: "productid",
            value: $(button).attr("data-productid"),
        });
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: this.success_desktop,
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //add a product to the cart/wishlist from the product details page (mobile devices version)
    addproducttocart_details_mobile: function(successredirecturl) {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = $("#aspnetForm").serializeArray();
        data.push({ name: "method", value: "AddProductToCart_Details_Mobile" });
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: function(response) {
                //if (response.updatetopcartsectionhtml) {
                //    $(AjaxCart.topcartselector).html(response.updatetopcartsectionhtml);
                //}
                //if (response.updatetopwishlistsectionhtml) {
                //    $(AjaxCart.topwishlistselector).html(response.updatetopwishlistsectionhtml);
                //}
                if (response.message) {
                    //display notification
                    if (response.success == true) {
                        //we do not display success message in mobile devices mode
                        //just redirect a user to the cart/wishlist
                        location.href = successredirecturl;
                    } else {
                        //error
                        displayStandardAlertNotification(response.message);
                    }
                    return false;
                }
                if (response.redirect) {
                    location.href = response.redirect;
                    return true;
                }
                return false;
            },
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //update cart
    updatecart: function() {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = $("#aspnetForm").serializeArray();
        data.push({ name: "method", value: "UpdateCart" });
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: this.success_desktop,
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //remove from cart
    removefromcart: function(button) {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = {
            method: "RemoveFromCart",
            itemguid: $(button).data("itemguid"),
        };
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            //success: this.success_desktop,
            success: function() {
                location.reload();
            },
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //remove from cart
    removefromwishlist: function(button) {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = {
            method: "RemoveFromWishlist",
            itemguid: $(button).data("itemguid"),
        };
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: function() {
                location.reload();
            },
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //cart to wishlist
    carttowishlist: function(button) {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = {
            method: "CartToWishlist",
            itemguid: $(button).data("itemguid"),
        };
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: function() {
                location.reload();
            },
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    // wishlist to cart
    wishlisttocart: function(button) {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = {
            method: "WishlistToCart",
            itemguid: $(button).data("itemguid"),
        };
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: function() {
                location.reload();
            },
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //apply coupon
    applycoupon: function() {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = {
            method: "ApplyCoupon",
            couponcode: $("#couponCode").val(),
        };
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: function(response) {
                if (response.success == false)
                    $(".coupon-apply-error").text(response.message);
                else location.reload();
                //setLocation(response.redirect);
            },
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    //remove coupon
    removecoupon: function() {
        if (this.loadWaiting != false) {
            return;
        }
        this.setLoadWaiting(true);

        var urladd = siteRoot + "/Product/Services/CartService.aspx";
        var data = { method: "RemoveCoupon" };
        $.ajax({
            cache: false,
            url: urladd,
            data: data,
            type: "post",
            success: function(response) {
                location.reload();
                //setLocation(response.redirect);
            },
            complete: this.resetLoadWaiting,
            error: this.ajaxFailure,
        });
    },

    success_desktop: function(response) {
        if (response.updatetopcartsectionhtml) {
            $(AjaxCart.topcartselector).html(response.updatetopcartsectionhtml);
        }
        if (response.updatetopwishlistsectionhtml) {
            $(AjaxCart.topwishlistselector).html(
                response.updatetopwishlistsectionhtml
            );
        }
        if (response.updateflyoutcartsectionhtml) {
            var checkoutUrl = $(".checkout-url").data("checkouturl");
            //$(AjaxCart.flyoutcartselector).replaceWith(response.updateflyoutcartsectionhtml);
            $(AjaxCart.flyoutcartselector).replaceWith(
                $(response.updateflyoutcartsectionhtml).filter(
                    AjaxCart.flyoutcartselector
                )
            );
            if (checkoutUrl != null)