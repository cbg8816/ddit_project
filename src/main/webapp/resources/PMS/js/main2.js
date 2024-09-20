!function(r) {
    var t;
    function n() {
        var e = []
          , t = function() {
            var e = document.createElement("div");
            e.style.visibility = "hidden",
            e.style.width = "100px",
            e.style.msOverflowStyle = "scrollbar",
            document.body.appendChild(e);
            var t = e.offsetWidth;
            e.style.overflow = "scroll";
            var i = document.createElement("div");
            i.style.width = "100%",
            e.appendChild(i);
            i = i.offsetWidth;
            return e.parentNode.removeChild(e),
            t - i
        }();
        window_width = r(window).width() + t,
        window_height = r(window).height(),
        is_phone = window_width < 768,
        is_mobile = window_width < 992,
        is_tablet_portrait = 768 <= window_width && window_width < 992,
        is_tablet_landscape = 992 <= window_width && window_width < 1200 && window_height <= 768,
        is_tablet = is_tablet_portrait || is_tablet_landscape,
        is_desktop = 992 <= window_width,
        is_desktop_large = 1200 <= window_width,
        is_desktop_xxl = 1700 <= window_width && 800 <= window_height,
        is_phone && e.push("mq_phone"),
        is_mobile && e.push("mq_mobile"),
        is_tablet_portrait && e.push("mq_tablet_portrait"),
        is_tablet_landscape && e.push("mq_tablet_landscape"),
        is_tablet && e.push("mq_tablet"),
        is_desktop && e.push("mq_desktop"),
        is_desktop_large && e.push("mq_desktop_large"),
        is_desktop_xxl && e.push("mq_desktop_xxl"),
        r("html").removeClass("mq_phone"),
        r("html").removeClass("mq_mobile"),
        r("html").removeClass("mq_tablet_portrait"),
        r("html").removeClass("mq_tablet_landscape"),
        r("html").removeClass("mq_tablet"),
        r("html").removeClass("mq_desktop"),
        r("html").removeClass("mq_desktop_xxl"),
        r("html").addClass(e.join(" "))
    }
    jQuery,
    t = "smartresize",
    jQuery.fn[t] = function(e) {
        return e ? this.bind("resize", (i = e,
        function() {
            var e = this
              , t = arguments;
            o ? clearTimeout(o) : a && i.apply(e, t),
            o = setTimeout(function() {
                a || i.apply(e, t),
                o = null
            }, s || 100)
        }
        )) : this.trigger(t);
        var i, s, a, o
    }
    ,
    jQuery(window).load(function() {
        n(),
        0 < r(".the_content table").length && r(".the_content table").each(function() {
            r(this).wrapAll('<div class="table_wrap"></div>')
        }),
        0 < r(".description table").length && r(".description table").each(function() {
            r(this).wrapAll('<div class="table_wrap"></div>')
        })
    }),
    jQuery(window).smartresize(function() {
        n(),
        d()
    }),
    jQuery(document).ready(function() {
        var i, s, a, o, e, l, c;
        n(),
        d(),
        function() {
            var i = r("#open_menu")
              , s = r("#menu_sidebar_wrap")
              , e = s.find(".close");
            i.click(function() {
                s.fadeIn(function() {
                    s.addClass("visible")
                }),
                r("html").addClass("no_scroll")
            }),
            e.click(function() {
                s.removeClass("visible"),
                s.fadeOut(),
                r("html").removeClass("no_scroll")
            }),
            r(document).click(function(e) {
                var t = !0;
                0 < r(e.target).closest(i).length && (t = !1),
                (t = 0 < r(e.target).closest(s.find(".menu_sidebar")).length ? !1 : t) && s.hasClass("visible") && (s.removeClass("visible"),
                s.fadeOut(),
                r("html").removeClass("no_scroll"))
            });
            window.Scrollbar
        }(),
        r("#skip_to_content").click(function() {
            var e, t = r("main, .section.main_content, h1");
            0 < t.length && (e = t.eq(0).offset().top - r("#header").height(),
            r("html,body").animate({
                scrollTop: e
            }),
            t.eq(0).focus())
        }),
        r("#acc_bw").on("click", function() {
            accorAccessibilityStatus.color = "bw",
            _()
        }),
        r("#acc_by").on("click", function() {
            accorAccessibilityStatus.color = "by",
            _()
        }),
        r("#acc_readable_font").on("click", function() {
            accorAccessibilityStatus.font = "readable",
            _()
        }),
        r("#acc_larger_spacing").on("click", function() {
            accorAccessibilityStatus.letterSpacing = "large",
            _()
        }),
        r("#acc_reset").on("click", function() {
            accorAccessibilityStatus = {
                color: "default",
                fontSize: "normal",
                letterSpacing: "normal"
            },
            _(!0)
        }),
        u("#main_book a"),
        u("#mobile_book_now a"),
        u("#reservation_section .open_bookingform a"),
        i = r("#lang_selector"),
        s = r("#languages_wrap"),
        e = s.find(".close"),
        i.click(function() {
            s.fadeIn("fast", function() {
                f("#languages"),
                s.addClass("visible"),
                s.focus()
            }),
            r("html").addClass("no_scroll")
        }),
        e.click(function() {
            s.fadeOut(),
            s.removeClass("visible"),
            r("html").removeClass("no_scroll")
        }),
        r(document).click(function(e) {
            var t = !0;
            0 < r(e.target).closest(i).length && (t = !1),
            (t = 0 < r(e.target).closest(s.find("#languages")).length ? !1 : t) && s.hasClass("visible") && (s.removeClass("visible"),
            s.fadeOut(),
            r("html").removeClass("no_scroll"))
        }),
        r("#languages_wrap .other_langs").submit(function(e) {
            e.preventDefault();
            var t = r(this).find("select")
              , e = t.val()
              , t = t.data("errormsg");
            "" === e ? alert(t) : window.open(e, "_blank")
        }),
        a = r("#accessibility_btn"),
        o = r("#accessibility_panel_wrap"),
        e = o.find(".close"),
        a.click(function() {
            o.fadeIn("fast", function() {
                f("#accessibility_panel"),
                o.addClass("visible"),
                o.focus()
            }),
            r("html").addClass("no_scroll")
        }),
        e.click(function() {
            o.fadeOut(),
            o.removeClass("visible"),
            r("html").removeClass("no_scroll")
        }),
        r(document).click(function(e) {
            var t = !0;
            0 < r(e.target).closest(a).length && (t = !1),
            (t = 0 < r(e.target).closest(o.find("#accessibility_panel")).length ? !1 : t) && o.hasClass("visible") && (o.removeClass("visible"),
            o.fadeOut(),
            r("html").removeClass("no_scroll"))
        }),
        0 < (e = r(".scrollToElement a")).size() && e.each(function() {
            var i = r(this);
            i.click(function() {
                var e = "#" + i.attr("data-scroll")
                  , t = r("#header").height()
                  , t = r(e).offset().top - t;
                r("html,body").stop().animate({
                    scrollTop: t
                }, 500),
                (0 < r(e).find(".slick-initialized").length ? r(e).find(".slick-slide:not(.slick-cloned) a") : r(e).find('a,input[type!="hidden"]')).eq(0).focus(),
                i.trigger("builderDeformEvent")
            })
        }),
        l = r(".header-menu > ul > li"),
        c = l.length,
        l.each(function(e) {
            var i, s, t = r(this).find("> a"), a = r(this), o = a.find(".sub-menu"), n = l.not(a).find(".sub-menu");
            t.focus(function() {
                o.show(),
                n.attr("style", "")
            }),
            e === c - 1 && 0 < a.find(".sub-menu").length && (a = (i = a.find(".sub-menu")).find("li > a"),
            s = a.length,
            a.each(function(e) {
                var t = r(this);
                e === s - 1 && t.on("focusout", function() {
                    i.attr("style", "")
                })
            }))
        }),
        document.addEventListener("keydown", function(e) {
            9 === e.which && (r("#accessibility_btn").focus(function() {
                r("#accessibility_btn").keyup(function(e) {
                    13 === e.which && r("#accessibility_panel .close").focus()
                }),
                r("#acc_reset").focusout(function() {
                    var e = r(this).closest("#accessibility_panel").find(".close");
                    e.focus(),
                    e.keyup(function(e) {
                        13 === e.which && r("#accessibility_btn").focus()
                    })
                })
            }),
            r("#lang_selector").focus(function() {
                r("#lang_selector").keyup(function(e) {
                    13 === e.which && r("#languages_wrap .close").focus()
                }),
                r("#languages .other_langs .select input[type=submit]").focusout(function() {
                    var e = r("#languages_wrap .close");
                    e.focus(),
                    e.keyup(function(e) {
                        13 === e.which && r("#lang_selector").focus()
                    })
                })
            }),
            r("#open_menu").focus(function() {
                r("#open_menu").keyup(function(e) {
                    13 === e.which && r("#menu_sidebar_wrap .close_sidebar").focus()
                }),
                r("#menu_sidebar_wrap .menu_sidebar .address .element a").focusout(function() {
                    var e = r("#menu_sidebar_wrap .close_sidebar");
                    e.focus(),
                    e.keyup(function(e) {
                        13 === e.which && r("#open_menu").focus()
                    })
                })
            }),
            r("#header_wrapper").hasClass("hidden_book_now") || (r("#main_book a").focus(function() {
                r("#main_book a").keyup(function(e) {
                    var t;
                    13 === e.which && (t = document.getElementById("bookingform_sidebar_wrap"),
                    setTimeout(function() {
                        t.classList.contains("visible") && r("#bookingform_sidebar_wrap.visible  .close_sidebar").focus()
                    }, 400))
                })
            }),
            r("#bookingform_sidebar_wrap.visible .bookingform .wrap input[type=submit]").focusout(function() {
                var e = r(".bookingform_sidebar_wrap.visible .close_sidebar");
                e.focus(),
                e.keyup(function(e) {
                    13 === e.which && r("#main_book a").focus()
                })
            })))
        }),
        r(document).on("afterShow.fb", function(e, t, i) {
            r(".fancybox-button").each(function(e) {
                "none" === r(this).css("display") ? r(this).attr("tabindex", -1) : r(this).attr("tabindex", 0)
            }),
            r('.fancybox-button:not([tabindex="-1"])').first().focus()
        })
    }),
    r(window).scroll(function() {
        d()
    });
    var o = r("body").hasClass("home");
    function d() {
        var e = r("#header_wrapper")
          , t = r("#top_bar").height()
          , i = r(".slideshow_container")
          , s = 0 < i.length ? i.height() : 0
          , a = r(window).scrollTop();
        r(document.body).hasClass("page-template-template-restaurant") ? (i = r(".anchors"),
        a > r(".anchors_wrap").offset().top ? i.addClass("fixed") : i.removeClass("fixed")) : (t < a ? (e.addClass("fixed"),
        (r(document.body).hasClass("page-template-template-landing") || r(document.body).hasClass("page-template-template-landing-offer")) && e.find("#main_book a").removeAttr("tabindex")) : (e.removeClass("fixed"),
        (r(document.body).hasClass("page-template-template-landing") || r(document.body).hasClass("page-template-template-landing-offer")) && e.find("#main_book a").attr("tabindex", -1)),
        o && (s < a ? (e.removeClass("hidden_book_now"),
        e.find("#main_book a").removeAttr("tabindex")) : (e.addClass("hidden_book_now"),
        e.find("#main_book a").attr("tabindex", -1))))
    }
    function u(i) {
        var i = r(i)
          , s = r(".bookingform_sidebar_wrap")
          , e = s.find(".close")
          , a = r("#mobile_bar");
        i.click(function() {
            s.fadeIn(function() {
                s.addClass("visible"),
                a.addClass("hidden")
            }),
            r("html").addClass("no_scroll")
        }),
        e.click(function() {
            s.removeClass("visible"),
            s.fadeOut(),
            a.removeClass("hidden"),
            r("html").removeClass("no_scroll")
        }),
        r(document).click(function(e) {
            var t = !0;
            0 < r(e.target).closest(i).length && (t = !1),
            0 < r(e.target).closest(s.find(".bookingform_sidebar")).length && (t = !1),
            (0 < r(e.target).closest(r("#ui-datepicker-div")).length || r(e.target).hasClass("ui-icon")) && (t = !1),
            (t = window_height < 700 ? !1 : t) && (s.hasClass("visible") && (s.removeClass("visible"),
            s.fadeOut(),
            r("html").removeClass("no_scroll")),
            a.removeClass("hidden"))
        })
    }
    function f(e) {
        var t, i = r(e);
        is_phone || (t = r(window).height(),
        e = i.outerHeight(),
        i.css({
            "margin-top": e = e < t ? (t - e) / 2 : 20,
            "margin-bottom": e
        }))
    }
    window.accorAccessibilityStatus = {
        color: "default",
        font: "normal",
        letterSpacing: "normal"
    };
    var i = "accor_accessibility";
    function _(e) {
        e = e || !1;
        var t = r("html");
        "bw" == accorAccessibilityStatus.color && (t.addClass("accessibility_BW"),
        t.removeClass("accessibility_BY")),
        "by" == accorAccessibilityStatus.color && (t.addClass("accessibility_BY"),
        t.removeClass("accessibility_BW")),
        "large" == accorAccessibilityStatus.letterSpacing && t.addClass("accessibility_larger_spacing"),
        "readable" == accorAccessibilityStatus.font && t.addClass("accessibility_readable_font"),
        e && (t.removeClass("accessibility_BW"),
        t.removeClass("accessibility_BY"),
        t.removeClass("accessibility_readable_font"),
        t.removeClass("accessibility_larger_spacing")),
        t = JSON.stringify(accorAccessibilityStatus),
        Cookies.set(i, t, 1e3)
    }
    !function() {
        var e = Cookies.get(i);
        if (e) {
            try {
                var t = JSON.parse(e);
                void 0 !== t.color && (accorAccessibilityStatus.color = t.color),
                void 0 !== t.fontSize && (accorAccessibilityStatus.fontSize = t.fontSize),
                void 0 !== t.letterSpacing && (accorAccessibilityStatus.letterSpacing = t.letterSpacing),
                void 0 !== t.font && (accorAccessibilityStatus.font = t.font)
            } catch (e) {}
            _()
        }
    }()
}(jQuery);
//# sourceMappingURL=main.min.js.map
