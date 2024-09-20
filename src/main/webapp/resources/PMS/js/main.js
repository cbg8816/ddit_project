(function ($) {
    (function ($, sr) {
        var debounce = function (func, threshold, execAsap) {
            var timeout;
            return function debounced() {
                var obj = this, args = arguments;

                function delayed() {
                    if (!execAsap)
                        func.apply(obj, args);
                    timeout = null;
                };
                if (timeout)
                    clearTimeout(timeout);
                else if (execAsap)
                    func.apply(obj, args);

                timeout = setTimeout(delayed, threshold || 100);
            };
        }
        // smartresize
        jQuery.fn[sr] = function (fn) {
            return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr);
        };
    })(jQuery, 'smartresize');

    function refresh_size_queries() {
        var classes = [];
        var scrollbarwidth = getScrollbarWidth();
        window_width = $(window).width() + scrollbarwidth;
        window_height = $(window).height();
        is_phone = (window_width < 768);
        is_mobile = (window_width < 992);
        is_tablet_portrait = (window_width >= 768 && window_width < 992);
        is_tablet_landscape = (window_width >= 992 && window_width < 1200 && window_height <= 768);
        is_tablet = is_tablet_portrait || is_tablet_landscape;
        is_desktop = (window_width >= 992);
        is_desktop_large = (window_width >= 1200);
        is_desktop_xxl = (window_width >= 1700 && window_height >= 800);

        if (is_phone) {
            classes.push('mq_phone');
        }
        if (is_mobile) {
            classes.push('mq_mobile');
        }
        if (is_tablet_portrait) {
            classes.push('mq_tablet_portrait');
        }
        if (is_tablet_landscape) {
            classes.push('mq_tablet_landscape');
        }
        if (is_tablet) {
            classes.push('mq_tablet');
        }
        if (is_desktop) {
            classes.push('mq_desktop');
        }
        if (is_desktop_large) {
            classes.push('mq_desktop_large');
        }
        if (is_desktop_xxl) {
            classes.push('mq_desktop_xxl');
        }


        $('html').removeClass('mq_phone');
        $('html').removeClass('mq_mobile');
        $('html').removeClass('mq_tablet_portrait');
        $('html').removeClass('mq_tablet_landscape');
        $('html').removeClass('mq_tablet');
        $('html').removeClass('mq_desktop');
        $('html').removeClass('mq_desktop_xxl');

        $('html').addClass(classes.join(' '));

    }

    function getScrollbarWidth() {
        var outer = document.createElement("div");
        outer.style.visibility = "hidden";
        outer.style.width = "100px";
        outer.style.msOverflowStyle = "scrollbar"; // needed for WinJS apps
        document.body.appendChild(outer);
        var widthNoScroll = outer.offsetWidth;
        // force scrollbars
        outer.style.overflow = "scroll";
        // add innerdiv
        var inner = document.createElement("div");
        inner.style.width = "100%";
        outer.appendChild(inner);
        var widthWithScroll = inner.offsetWidth;
        // remove divs
        outer.parentNode.removeChild(outer);
        return widthNoScroll - widthWithScroll;
    }

    jQuery(window).on(function () {
        refresh_size_queries();
        if ($('.the_content table').length > 0) {
            $('.the_content table').each(function () {
                $(this).wrapAll('<div class="table_wrap"></div>');
            })
        }
        if ($('.description table').length > 0) {
            $('.description table').each(function () {
                $(this).wrapAll('<div class="table_wrap"></div>');
            })
        }
    });

    jQuery(window).smartresize(function () {
        refresh_size_queries();
        headerPosition();
    });

    jQuery(document).ready(function () {
        // $('[data-fancybox]:not(.slick-cloned)').fancybox({
        // 	beforeLoad: function (istance, current){
        // 		console.log('Before loadddddd!!!!!!');
        // 	},
        // 	afterLoad: function (istance, current){
        // 		console.log('After loadddddd!!!!!!');
        // 	},
        // 	beforeShow: function (instance, current) {
        // 		console.log('Before show!!!!!!');
        // 		console.log('instance >',instance);
        // 		current.opts.baseTpl = '<div class="fancybox-container" role="dialog" tabindex="1">' +
        // 			'<div class="fancybox-bg"></div>' +
        // 			'<div class="fancybox-inner">' +
        // 			'<div class="fancybox-infobar"><span data-fancybox-index></span>&nbsp;/&nbsp;<span data-fancybox-count></span></div>' +
        // 			'<div class="fancybox-toolbar">{{buttons}}</div>' +
        // 			'<div class="fancybox-navigation">{{arrows}}</div>' +
        // 			'<div class="fancybox-stage"></div>' +
        // 			'<div class="fancybox-caption"><div class=""fancybox-caption__body"></div></div>' +
        // 			'</div>'; +
        // 			'</div>'
        // 		//current.$slide.attr("tabindex",1).focus();
        // 		console.log('current >',current.opts.baseTpl);
        // 	},
        // 	afterShow: function (instance, current) {
        // 		console.log('After show!!!!!!');
        // 	},
        // 	beforeClose : function (instance, current) {
        // 		console.log('Before Close!!!!!!');
        // 	},
        // 	afterClose : function (instance, current) {
        // 		console.log('After Close!!!!!!');
        // 	},
        // 	onInit: function (instance, current) {
        // 		console.log('onInit!!!!!!');
        // 	},
        // 	onActivate:function (instance, current) {
        // 		console.log('onActive!!!!!!');
        // 	},
        // 	onDeactivate : function (instance, current) {
        // 		console.log('onDeactive!!!!!!');
        // 	},
        // });
        refresh_size_queries();
        headerPosition();
        openMenu();
        bindAccessibility();
        openBookingform('#main_book a');
        openBookingform('#mobile_book_now a');
        openBookingform('#reservation_section .open_bookingform a');
        openLanguages();
        openAccessibilityPanel();
        // scrollToElement();
        manager_on_focus();
    });

    $(window).scroll(function () {
        headerPosition();
    });

    var isIndex = $('body').hasClass('home');

    function headerPosition() {
        var header = $('#header_wrapper');
        var hh = $('#top_bar').height();
        var slideshow = $('.slideshow_container');
        var sh = slideshow.length > 0 ? slideshow.height() : 0;
        var scroll = $(window).scrollTop();

        if (!$(document.body).hasClass('page-template-template-restaurant')) {
            if (scroll > hh) {
                header.addClass('fixed');
                if ($(document.body).hasClass('page-template-template-landing') || $(document.body).hasClass('page-template-template-landing-offer')) {
                    header.find('#main_book a').removeAttr('tabindex');
                }
            } else {
                header.removeClass('fixed');
                if ($(document.body).hasClass('page-template-template-landing') || $(document.body).hasClass('page-template-template-landing-offer')) {
                    header.find('#main_book a').attr('tabindex', -1);
                }
            }
            if (isIndex) {
                if (scroll > sh) {
                    header.removeClass('hidden_book_now');
                    header.find('#main_book a').removeAttr('tabindex');
                } else {
                    header.addClass('hidden_book_now');
                    header.find('#main_book a').attr('tabindex', -1);
                }
            }
        } else {
            var anchors = $('.anchors');
            if (scroll > $('.anchors_wrap').offset().top) {
                anchors.addClass('fixed');
            } else {
                anchors.removeClass('fixed');
            }
        }

    }

    function openMenu() {
        var btn = $('#open_menu');
        var sidebar = $('#menu_sidebar_wrap');
        var close = sidebar.find('.close');

        btn.click(function () {
            sidebar.fadeIn(function () {
                sidebar.addClass('visible');
            });
            $('html').addClass('no_scroll');
        });
        close.click(function () {
            sidebar.removeClass('visible');
            sidebar.fadeOut();
            $('html').removeClass('no_scroll');
        });

        $(document).click(function (event) {
            var closeme = true;

            if ($(event.target).closest(btn).length > 0) {
                closeme = false;
            }
            if ($(event.target).closest(sidebar.find('.menu_sidebar')).length > 0) {
                closeme = false;
            }
            if (closeme) {
                if (sidebar.hasClass('visible')) {
                    sidebar.removeClass('visible');
                    sidebar.fadeOut();
                    $('html').removeClass('no_scroll');
                }
            }
        });
        var Scrollbar = window.Scrollbar;
        var options = {
            alwaysShowTracks: true,
        };
    }

    function openBookingform(btn) {
        var btn = $(btn);
        var sidebar = $('.bookingform_sidebar_wrap');
        var close = sidebar.find('.close');
        var mobileBar = $('#mobile_bar');

        btn.click(function () {
            sidebar.fadeIn(function () {
                sidebar.addClass('visible');
                mobileBar.addClass('hidden');
            });
            $('html').addClass('no_scroll');
        });

        close.click(function () {
            sidebar.removeClass('visible');
            sidebar.fadeOut();
            mobileBar.removeClass('hidden');
            $('html').removeClass('no_scroll');
        });

        $(document).click(function (event) {
            var closeme = true;

            if ($(event.target).closest(btn).length > 0) {
                closeme = false;
            }
            if ($(event.target).closest(sidebar.find('.bookingform_sidebar')).length > 0) {
                closeme = false;
            }
            if ($(event.target).closest($('#ui-datepicker-div')).length > 0 || $(event.target).hasClass('ui-icon')) {
                closeme = false;
            }
            if (window_height < 700) {
                closeme = false;
            }


            if (closeme) {
                if (sidebar.hasClass('visible')) {
                    sidebar.removeClass('visible');
                    sidebar.fadeOut();
                    $('html').removeClass('no_scroll');
                }
                mobileBar.removeClass('hidden');
            }
        });
    }

    function openLanguages() {
        var btn = $('#lang_selector');
        var overlay = $('#languages_wrap');
        var close = overlay.find('.close');

        btn.click(function () {

            overlay.fadeIn('fast', function () {
                centerOverlay('#languages');
                overlay.addClass('visible');
                overlay.focus();
            });
            $('html').addClass('no_scroll');
        });
        close.click(function () {
            overlay.fadeOut();
            overlay.removeClass('visible');
            $('html').removeClass('no_scroll');
        });

        $(document).click(function (event) {
            var closeme = true;

            if ($(event.target).closest(btn).length > 0) {
                closeme = false;
            }
            if ($(event.target).closest(overlay.find('#languages')).length > 0) {
                closeme = false;
            }
            if (closeme) {
                if (overlay.hasClass('visible')) {
                    overlay.removeClass('visible');
                    overlay.fadeOut();
                    $('html').removeClass('no_scroll');
                }
            }
        });
        $('#languages_wrap .other_langs').submit(function (event) {
            event.preventDefault();
            var select = $(this).find('select');
            var url = select.val();
            var errorMsg = select.data('errormsg');
            if (url === '') {
                alert(errorMsg);
            } else {
                window.open(url, '_blank');
            }
        });


    }

    function openAccessibilityPanel() {
        var btn = $('#accessibility_btn');
        var overlay = $('#accessibility_panel_wrap');
        var close = overlay.find('.close');

        btn.click(function () {
            overlay.fadeIn('fast', function () {
                centerOverlay('#accessibility_panel');
                overlay.addClass('visible');
                overlay.focus();
            });
            $('html').addClass('no_scroll');
        });
        close.click(function () {
            overlay.fadeOut();
            overlay.removeClass('visible');
            $('html').removeClass('no_scroll');
        });

        $(document).click(function (event) {
            var closeme = true;

            if ($(event.target).closest(btn).length > 0) {
                closeme = false;
            }
            if ($(event.target).closest(overlay.find('#accessibility_panel')).length > 0) {
                closeme = false;
            }
            if (closeme) {
                if (overlay.hasClass('visible')) {
                    overlay.removeClass('visible');
                    overlay.fadeOut();
                    $('html').removeClass('no_scroll');
                }
            }
        });

    }

    function centerOverlay(id) {
        var element = $(id);

        if (!is_phone) {

            var windowH = $(window).height();
            var elementH = element.outerHeight();
            var margin = 20;
            if (elementH < windowH) {
                margin = (windowH - elementH) / 2;
            }
            element.css({
                'margin-top': margin,
                'margin-bottom': margin,
            })

        }
    }

    // function scrollToElement() {
    //     var btn = $('.scrollToElement a');
    //     if (btn.size() > 0) {
    //         btn.each(function () {
    //             var link = $(this);
    //             link.click(function () {
    //                 var goTo = '#' + link.attr('data-scroll');
    //                 var top_part = $('#header').height();
    //                 // var paddingTxt = $('.section').eq(1).css('padding-bottom');
    //                 // var padding = paddingTxt.replace('px', '');
    //                 var top = $(goTo).offset().top - top_part;
    //                 $('html,body').stop().animate({scrollTop: top}, 500);
    //                 if ($(goTo).find('.slick-initialized').length > 0) {
    //                     $(goTo).find('.slick-slide:not(.slick-cloned) a').eq(0).focus();
    //                 } else {
    //                     $(goTo).find('a,input[type!="hidden"]').eq(0).focus();
    //                 }
    //                 link.trigger("builderDeformEvent");
    //             });

    //         })
    //     }
    // }

    //Acessibility function
    window.accorAccessibilityStatus = {
        color: 'default',
        font: 'normal',
        letterSpacing: 'normal'
    };
    var accorAccessibilityCookieName = 'accor_accessibility';
    // (function () {
    //     var tmp = Cookies.get(accorAccessibilityCookieName);
    //     if (tmp) {
    //         try {
    //             var obj = JSON.parse(tmp);
    //             if (typeof obj.color !== 'undefined') {
    //                 accorAccessibilityStatus.color = obj.color;
    //             }
    //             if (typeof obj.fontSize !== 'undefined') {
    //                 accorAccessibilityStatus.fontSize = obj.fontSize;
    //             }
    //             if (typeof obj.letterSpacing !== 'undefined') {
    //                 accorAccessibilityStatus.letterSpacing = obj.letterSpacing;
    //             }
    //             if (typeof obj.font !== 'undefined') {
    //                 accorAccessibilityStatus.font = obj.font;
    //             }
    //         } catch (e) {
    //         }
    //         applyAccessibilityStatus();
    //     }
    // })();

    function saveAccessibilityStatus() {
        var str = JSON.stringify(accorAccessibilityStatus);
        Cookies.set(accorAccessibilityCookieName, str, 1000);
    }

    function applyAccessibilityStatus(reset) {
        reset = reset || false;
        var html = $('html');
        if (accorAccessibilityStatus.color == 'bw') {
            html.addClass('accessibility_BW');
            html.removeClass('accessibility_BY');
        }
        if (accorAccessibilityStatus.color == 'by') {
            html.addClass('accessibility_BY');
            html.removeClass('accessibility_BW');
        }
        if (accorAccessibilityStatus.letterSpacing == 'large') {
            html.addClass('accessibility_larger_spacing');
        }
        if (accorAccessibilityStatus.font == 'readable') {
            html.addClass('accessibility_readable_font');
        }
        if (reset) {
            html.removeClass('accessibility_BW');
            html.removeClass('accessibility_BY');
            html.removeClass('accessibility_readable_font');
            html.removeClass('accessibility_larger_spacing');
        }
        saveAccessibilityStatus();
    }


    function bindAccessibility() {
        $('#skip_to_content').click(function () {
            var elements = $('main, .section.main_content, h1');
            if (elements.length > 0) {
                var top = elements.eq(0).offset().top - $('#header').height();
                $('html,body').animate({scrollTop: top});
                elements.eq(0).focus();
            }
        });

        $('#acc_bw').on('click', function () {
            accorAccessibilityStatus.color = 'bw';
            applyAccessibilityStatus();
        });
        $('#acc_by').on('click', function () {
            accorAccessibilityStatus.color = 'by';
            applyAccessibilityStatus();
        });
        $('#acc_readable_font').on('click', function () {
            accorAccessibilityStatus.font = 'readable';
            applyAccessibilityStatus();
        });
        $('#acc_larger_spacing').on('click', function () {
            accorAccessibilityStatus.letterSpacing = 'large';
            applyAccessibilityStatus();
        });
        $('#acc_reset').on('click', function () {
            accorAccessibilityStatus = {
                color: 'default',
                fontSize: 'normal',
                letterSpacing: 'normal'
            };
            applyAccessibilityStatus(true);
        });
    }

    function manager_on_focus() {
        //This function is for accessibility
        // Display submenu
        var el_li = $('.header-menu > ul > li'),
            total_li = el_li.length;
        el_li.each(function (index) {
            var anchor = $(this).find('> a'),
                li = $(this),
                sub_menu = li.find('.sub-menu'),
                other = el_li.not(li).find('.sub-menu');
            anchor.focus(function () {
                sub_menu.show();
                other.attr('style', '');
            });

            //Detect last item has a submenu
            if (index === total_li - 1) {
                if (li.find('.sub-menu').length > 0) {
                    var last_sub_menu = li.find('.sub-menu'),
                        children = last_sub_menu.find('li > a'),
                        total_children = children.length;
                    children.each(function (i) {
                        var child_item = $(this);
                        if (i === total_children - 1) {
                            child_item.on('focusout', function () {
                                last_sub_menu.attr('style', '');
                            });
                        }
                    });
                }
            }
        });

        document.addEventListener("keydown", function (event) {
            if (event.which === 9) {
                //accessibility panel
                $('#accessibility_btn').focus(function () {
                    $('#accessibility_btn').keyup(function (e) {
                        if (e.which === 13) {
                            $('#accessibility_panel .close').focus();
                        }
                    });
                    $('#acc_reset').focusout(function () {
                        var close = $(this).closest('#accessibility_panel').find('.close');
                        close.focus();
                        close.keyup(function (e) {
                            if (e.which === 13) {
                                $('#accessibility_btn').focus();
                            }
                        });
                    });
                });
                //language selector
                $('#lang_selector').focus(function () {
                    $('#lang_selector').keyup(function (e) {
                        if (e.which === 13) {
                            $('#languages_wrap .close').focus();
                        }
                    });
                    $('#languages .other_langs .select input[type=submit]').focusout(function () {
                        var close = $('#languages_wrap .close');
                        close.focus();
                        close.keyup(function (e) {
                            if (e.which === 13) {
                                $('#lang_selector').focus();
                            }
                        });
                    });
                });

                //sidebar menu
                $('#open_menu').focus(function () {
                    $('#open_menu').keyup(function (e) {
                        if (e.which === 13) {
                            $('#menu_sidebar_wrap .close_sidebar').focus();
                        }
                    });
                    $('#menu_sidebar_wrap .menu_sidebar .address .element a').focusout(function () {
                        var close = $('#menu_sidebar_wrap .close_sidebar');
                        close.focus();
                        close.keyup(function (e) {
                            if (e.which === 13) {
                                $('#open_menu').focus();
                            }
                        });
                    });
                });
                //sidebar booknow
                if (!$('#header_wrapper').hasClass('hidden_book_now')) {
                    $('#main_book a').focus(function () {
                        $('#main_book a').keyup(function (e) {
                            if (e.which === 13) {
                                var bf_wrap = document.getElementById('bookingform_sidebar_wrap');
                                setTimeout(function () {
                                    if (bf_wrap.classList.contains('visible')) {
                                        $('#bookingform_sidebar_wrap.visible  .close_sidebar').focus();
                                    }
                                }, 400);

                            }
                        });
                    });
                    $('#bookingform_sidebar_wrap.visible .bookingform .wrap input[type=submit]').focusout(function () {
                        var close = $('.bookingform_sidebar_wrap.visible .close_sidebar');
                        close.focus();
                        close.keyup(function (e) {
                            if (e.which === 13) {
                                $('#main_book a').focus();
                            }
                        });
                    });
                }
            }

        });
        $(document).on('afterShow.fb', function (e, instance, slide) {
            var fancy_buttons = $('.fancybox-button');
            fancy_buttons.each(function (i) {
                if ($(this).css('display') === 'none') {
                    $(this).attr('tabindex', -1);
                } else {
                    $(this).attr('tabindex', 0);
                }
            });
            $('.fancybox-button:not([tabindex="-1"])').first().focus();
        });

    }

})(jQuery);