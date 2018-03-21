S.configAll({
	'defaultToCurrentScreen': true,
	'nudgePercentOf': 'screenSize',
	'resizePercentOf': 'screenSize',
	'windowHintsIgnoreHiddenWindows': true,
	'windowHintsShowIcons': false,
	'windowHintsSpread': true,
});

// Store current window states.
var windowStates = {};

var full = S.op('move', {
	'x' : 'screenOriginX',
	'y' : 'screenOriginY',
	'width' : 'screenSizeX',
	'height' : 'screenSizeY',
});
var center = S.op('move', {
	'x' : 'screenOriginX+((screenSizeX-windowSizeX)/2)',
	'y' : 'screenOriginY+((screenSizeY-windowSizeY)/2)',
	'width' : 'windowSizeX',
	'height' : 'windowSizeY',
});
var topLeft = S.op('corner', {
	'direction': 'top-left',
	'width': 'screenSizeX/2',
	'height': 'screenSizeY/2',
});
var topRight = S.op('corner', {
	'direction': 'top-right',
	'width': 'screenSizeX/2',
	'height': 'screenSizeY/2',
});
var bottomLeft = S.op('corner', {
	'direction': 'bottom-left',
	'width': 'screenSizeX/2',
	'height': 'screenSizeY/2',
});
var bottomRight = S.op('corner', {
	'direction': 'bottom-right',
	'width': 'screenSizeX/2',
	'height': 'screenSizeY/2',
});
// Left
var leftBarThird = S.op('push', {
	'direction': 'left',
	'style': 'bar-resize:screenSizeX/3',
});
var leftBarHalf = S.op('push', {
	'direction': 'left',
	'style': 'bar-resize:screenSizeX/2',
});
var leftBarTwoThirds = S.op('push', {
	'direction': 'left',
	'style': 'bar-resize:screenSizeX/3*2',
});
// Right
var rightBarThird = S.op('push', {
	'direction': 'right',
	'style': 'bar-resize:screenSizeX/3',
});
var rightBarHalf = S.op('push', {
	'direction': 'right',
	'style': 'bar-resize:screenSizeX/2',
});
var rightBarTwoThirds = S.op('push', {
	'direction': 'right',
	'style': 'bar-resize:screenSizeX/3*2',
});
// Top
var topBarThird = S.op('push', {
	'direction': 'top',
	'style': 'bar-resize:screenSizeY/3',
});
var topBarHalf = S.op('push', {
	'direction': 'top',
	'style': 'bar-resize:screenSizeY/2',
});
var topBarTwoThirds = S.op('push', {
	'direction': 'top',
	'style': 'bar-resize:screenSizeY/3*2',
});
// Bottom
var bottomBarThird = S.op('push', {
	'direction': 'bottom',
	'style': 'bar-resize:screenSizeY/3',
});
var bottomBarHalf = S.op('push', {
	'direction': 'bottom',
	'style': 'bar-resize:screenSizeY/2',
});
var bottomBarTwoThirds = S.op('push', {
	'direction': 'bottom',
	'style': 'bar-resize:screenSizeY/3*2',
});

function getCycleStates(states) {
	return function(win) {
		if (win.pid in windowStates &&
			windowStates[win.pid] !== undefined &&
			states.indexOf(windowStates[win.pid]) !== -1
		) {
			var nextIndex = (states.indexOf(windowStates[win.pid]) + 1) % 3;
			var nextState = states[nextIndex];
			windowStates[win.pid] = nextState;
		} else {
			windowStates[win.pid] = states[0];
		}

		eval(windowStates[win.pid] + '.run()');
	};
}

// Window cycling functions
var leftCycleOp = getCycleStates(['leftBarHalf', 'leftBarTwoThirds', 'leftBarThird']);
var rightCycleOp = getCycleStates(['rightBarHalf', 'rightBarTwoThirds', 'rightBarThird']);
var topCycleOp = getCycleStates(['topBarHalf', 'topBarTwoThirds', 'topBarThird']);
var bottomCycleOp = getCycleStates(['bottomBarHalf', 'bottomBarTwoThirds', 'bottomBarThird']);

// Push bindings
S.bind('j:ctrl,cmd', leftCycleOp);
S.bind('l:ctrl,cmd', rightCycleOp);
S.bind('i:ctrl,cmd', topCycleOp);
S.bind(',:ctrl,cmd', bottomCycleOp);
S.bind('u:ctrl,cmd', topLeft);
S.bind('o:ctrl,cmd', topRight);
S.bind('m:ctrl,cmd', bottomLeft);
S.bind('.:ctrl,cmd', bottomRight);
S.bind('k:ctrl,cmd', center);
S.bind(';:ctrl,cmd', full);

// Throw bindings
S.bind('j:ctrl;alt;cmd', S.op('throw', {
	'screen': 'left',
	'width' : 'screenSizeX',
	'height' : 'screenSizeY',
}));
S.bind('i:ctrl;alt;cmd', S.op('throw', {
	'screen': 'up',
	'width' : 'screenSizeX',
	'height' : 'screenSizeY',
}));
S.bind('l:ctrl;alt;cmd', S.op('throw', {
	'screen': 'right',
	'width' : 'screenSizeX',
	'height' : 'screenSizeY',
}));
S.bind(',:ctrl;alt;cmd', S.op('throw', {
	'screen': 'below',
	'width' : 'screenSizeX',
	'height' : 'screenSizeY',
}));
S.bind('k:ctrl;alt;cmd', full);
S.bind(';:ctrl;alt;cmd', full);

// Focus bindings
S.bind('j:ctrl;alt', S.op('focus', { direction: 'left'  }));
S.bind('i:ctrl;alt', S.op('focus', { direction: 'up'    }));
S.bind('l:ctrl;alt', S.op('focus', { direction: 'right' }));
S.bind(',:ctrl;alt', S.op('focus', { direction: 'down'  }));

// Hint binding
S.bind('space:ctrl;alt', S.op('hint', { characters: 'JKLASDFGH' }));
