/*
GNB, LeftMenu 공통 스크립트
주의 : 모바일에서는 애니메이션 효과들(fade, slide 등)이 제대로 작동하지 않음
*/

//GNB
$(function () {
    $('.gnb_sub').hide();
    $('.gnb_line').hide();
    var iSpeed = 300;

    //메뉴 다운
    $('.gnbTit').each(function () {
        $(this).mouseover(function () {
            var $menu = $(this).parent().find('ul.gnb_sub');

            if (!$menu.is(':visible')) {
                $('.gnb_line').slideDown(iSpeed);
                $('.gnb_sub').slideDown(iSpeed);
            }
        });
    });

    // 메뉴 업
    $('.gnb_line').mouseleave(function () {
        $('.gnb_sub').slideUp(iSpeed);
        $('.gnb_line').slideUp(iSpeed);
    });

    /**** GNB tab focus ****/
    // 메뉴 다운
    $(".gnbTit").each(function () {
        $(this).focusin(function () {
            $(this).mouseover();
        });
    });

    //메뉴 업
    $('#content_area').focusin(function () {
        $('.gnb_sub').slideUp(iSpeed - iSpeed);
        $('.gnb_line').slideUp(iSpeed - iSpeed);
    });
    /**** GNB tab focus ****/
});


//Left Menu
$(function () {
	var iSpeed = 100;

	//2뎁스 메뉴
	$('ul.lnb_sub > li').mouseover(function () {
		$(this).addClass('on');
	}).mouseout(function () {
		$(this).removeClass('on');
	});

	//1뎁스 메뉴
	$('img.imgSubTitle').css({ cursor: 'pointer' });
	$('img.imgSubTitle').click(function () {
		var subs = $(this).next('ul');
		if (!subs.is(':visible'))
			subs.slideDown(iSpeed);
		else
			subs.slideUp(iSpeed);
	});

	var sPath = location.pathname.replace('/pages/', '');
	sPath = sPath.substr(0, sPath.lastIndexOf('/'));

	$('img.imgSubTitle').each(function () {
		if (sPath == $(this).attr('menu')) {
			if ($(this).attr('src').indexOf('_off') > -1) {
				$(this).attr('src', $(this).attr('src').replace('_off', '_on'));
				$(this).click();
			}
		}
		else {
			if ($(this).attr('src').indexOf('_on') > -1) {
				$(this).attr('src', $(this).attr('src').replace('_on', '_off'));
			}

			//비활성 메뉴일 경우 : 마우스 오버 처리
			//$(this).mouseenter(function () {
			//	$(this).next('ul.lnb_sub').slideDown(iSpeed);
			//});

			//$(this).parent('li').mouseleave(function () {
			//	$(this).find('ul.lnb_sub').slideUp(iSpeed);
			//});
		}
	});
});

function login() {
	location.href = '/pages/login/login.asp';
}

function logout() {
	location.href = '/pages/login/logout.asp';
}

function joinMember() {
	location.href = "https://members.happypointcard.com/?url_check=PC";
}

function findAccount() {
	location.href = "https://members.happypointcard.com/member/member_inquiry.html?url_check=PC";
}

function changeInfo() {
	location.href = '/pages/login/change_info.asp';
}