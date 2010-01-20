// page init
$(function(){
	initCufon();
	initSlideShow();
	initNewsTicker();
});

// cufon init
function initCufon() {
	Cufon.replace('#nav .cufon', { fontFamily: 'Gotham', hover: true });
	Cufon.replace('.btn-orange', { fontFamily: 'Gotham', hover: false });
	Cufon.replace('.inform-box .title', { fontFamily: 'Gotham', hover: false });
	Cufon.replace('.btn01', { fontFamily: 'GothamMedium', hover: false });
	Cufon.replace('.btn03', { fontFamily: 'GothamMedium', hover: false });
	Cufon.replace('.btn04', { fontFamily: 'GothamMedium', hover: false });
	Cufon.replace('.twocolumn h2', { fontFamily: 'GothamMedium', hover: false });
	Cufon.replace('.account .title h2', { fontFamily: 'GothamMedium', hover: false });
	Cufon.replace('.btn02', { fontFamily: 'Gotham', hover: false });
	Cufon.replace('.btn02 span', { fontFamily: 'GothamMedium', hover: false });
	Cufon.replace('h1', { fontFamily: 'GothamLight', hover: false });
	Cufon.replace('.links h2', { fontFamily: 'GothamLight', hover: false });
	Cufon.replace('.articles h2', { fontFamily: 'Gotham', hover: false });
	Cufon.replace('.aside h4', { fontFamily: 'Gotham', hover: false });
	Cufon.replace('#main h3', { fontFamily: 'Gotham', hover: false });
}

// slideshow init
function initSlideShow() {
	$('div.slideshow').fadeGallery({
		slideElements:'div.slideset > div',
		btnPrev:'span.btn-prev a',
		btnNext:'span.btn-next a',
		disabledClass:'disabled',
		noCircle: true,
		pauseOnHover:true,
		autoRotation:false,
		autoHeight:false,
		switchTime:5000,
		duration:500
	});
}

// new ticker function
function initNewsTicker(){
	var _switchTime = 4000;
	var _slideSpeed = 450;
	var _hoverPause = true;

	$('div.news-ticker').each(function(){
		var _holder = $(this);
		var _slider = _holder.children();
		var _slides = _slider.children();
		var _slideCount = _slides.length;
		var _currentIndex = 0;
		var _timer;

		// news animation
		function scrollNews() {
			if(_currentIndex < _slideCount-1) _currentIndex++;
			else _currentIndex=0;
			_slider.animate({marginTop:-_slides.eq(_currentIndex).position().top},{duration:_slideSpeed,queue:false});
			autoSlide();
		}

		// autoscroll
		function autoSlide() {
			if(_timer) clearTimeout(_timer);
			_timer = setTimeout(scrollNews,_switchTime);
		}
		autoSlide();

		// hover pause
		if(_hoverPause) {
			_holder.hover(function(){
				if(_timer) clearTimeout(_timer);
			},autoSlide);
		}
	});
}

// slideshow plugin
jQuery.fn.fadeGallery = function(_options){
	var _options = jQuery.extend({
		slideElements:'div.slideset > div',
		pagerLinks:'div.pager a',
		btnNext:'a.next',
		btnPrev:'a.prev',
		btnPlayPause:'a.play-pause',
		pausedClass:'paused',
		disabledClass: 'disabled',
		playClass:'playing',
		activeClass:'active',
		startSlide:null,
		noCircle:false,
		pauseOnHover:true,
		autoRotation:false,
		autoHeight:false,
		switchTime:3000,
		duration:650,
		event:'click'
	},_options);

	return this.each(function(){
		// gallery options
		var _this = jQuery(this);
		var _slides = jQuery(_options.slideElements, _this);
		var _pagerLinks = jQuery(_options.pagerLinks, _this);
		var _btnPrev = jQuery(_options.btnPrev, _this);
		var _btnNext = jQuery(_options.btnNext, _this);
		var _btnPlayPause = jQuery(_options.btnPlayPause, _this);
		var _pauseOnHover = _options.pauseOnHover;
		var _autoRotation = _options.autoRotation;
		var _activeClass = _options.activeClass;
		var _disabledClass = _options.disabledClass;
		var _pausedClass = _options.pausedClass;
		var _playClass = _options.playClass;
		var _autoHeight = _options.autoHeight;
		var _duration = _options.duration;
		var _switchTime = _options.switchTime;
		var _controlEvent = _options.event;
		var _startSlide = _options.startSlide;
		var _noCycle = _options.noCircle;

		// gallery init
		var _hover = false;
		var _prevIndex = 0;
		var _currentIndex = 0;
		var _slideCount = _slides.length;
		var _timer;
		if(!_slideCount) return;

		_prevIndex = _slides.index(_slides.filter('.'+_activeClass));
		if(_prevIndex < 0) _prevIndex = _currentIndex = 0;
		else _currentIndex = _prevIndex;
		if(_startSlide != null) {
			if(_startSlide == 'random') _prevIndex = _currentIndex = Math.floor(Math.random()*_slideCount);
			else _prevIndex = _currentIndex = parseInt(_startSlide);
		}
		_slides.hide().eq(_currentIndex).show();
		if(_autoRotation) _this.removeClass(_pausedClass).addClass(_playClass);
		else _this.removeClass(_playClass).addClass(_pausedClass);

		// gallery control
		if(_btnPrev.length) {
			_btnPrev.bind(_controlEvent,function(){
				prevSlide();
				return false;
			});
		}
		if(_btnNext.length) {
			_btnNext.bind(_controlEvent,function(){
				nextSlide();
				return false;
			});
		}
		if(_pagerLinks.length) {
			_pagerLinks.each(function(_ind){
				jQuery(this).bind(_controlEvent,function(){
					if(_currentIndex != _ind) {
						_prevIndex = _currentIndex;
						_currentIndex = _ind;
						switchSlide();
					}
					return false;
				});
			});
		}

		// play pause section
		if(_btnPlayPause.length) {
			_btnPlayPause.bind(_controlEvent,function(){
				if(_this.hasClass(_pausedClass)) {
					_this.removeClass(_pausedClass).addClass(_playClass);
					_autoRotation = true;
					autoSlide();
				} else {
					if(_timer) clearTimeout(_timer);
					_this.removeClass(_playClass).addClass(_pausedClass);
				}
				return false;
			});
		}

		// gallery animation
		function prevSlide() {
			_prevIndex = _currentIndex;
			if(_currentIndex > 0) _currentIndex--;
			else {
				if(_noCycle) return;
				else _currentIndex = _slideCount-1;
			}
			switchSlide();
		}
		function nextSlide() {
			_prevIndex = _currentIndex;
			if(_currentIndex < _slideCount-1) _currentIndex++;
			else {
				if(_noCycle) return;
				else _currentIndex = 0;
			}
			switchSlide();
		}
		function refreshStatus() {
			if(_pagerLinks.length) _pagerLinks.removeClass(_activeClass).eq(_currentIndex).addClass(_activeClass);
			_slides.eq(_prevIndex).removeClass(_activeClass);
			_slides.eq(_currentIndex).addClass(_activeClass);
			if(_noCycle) {
				if(_btnPrev.length) {
					if(_currentIndex == 0) _btnPrev.addClass(_disabledClass);
					else _btnPrev.removeClass(_disabledClass);
				}
				if(_btnNext.length) {
					if(_currentIndex == _slideCount-1) _btnNext.addClass(_disabledClass);
					else _btnNext.removeClass(_disabledClass);
				}
			}
		}
		function switchSlide() {
			_slides.eq(_prevIndex).fadeOut(_duration);
			_slides.eq(_currentIndex).fadeIn(_duration);
			if(_autoHeight) _slides.eq(_currentIndex).parent().animate({height:_slides.eq(_currentIndex).outerHeight(true)},{duration:_duration,queue:false});
			refreshStatus();
			autoSlide();
		}

		// autoslide function
		function autoSlide() {
			if(!_autoRotation || _hover) return;
			if(_timer) clearTimeout(_timer);
			_timer = setTimeout(nextSlide,_switchTime+_duration);
		}
		if(_pauseOnHover) {
			_this.hover(function(){
				_hover = true;
				if(_timer) clearTimeout(_timer);
			},function(){
				_hover = false;
				autoSlide();
			});
		}
		refreshStatus();
		autoSlide();
	});
}