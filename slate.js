// Store current window states.
var windowStates = {};

var leftBarThird = S.op("push", {
	"direction": "left",
	"style": "bar-resize:screenSizeX/3"
});
var leftBarHalf = S.op("push", {
	"direction": "left",
	"style": "bar-resize:screenSizeX/2"
});
var leftBarTwoThirds = S.op("push", {
	"direction": "left",
	"style": "bar-resize:screenSizeX/3*2"
});
var rightBarThird = S.op("push", {
	"direction": "right",
	"style": "bar-resize:screenSizeX/3"
});
var rightBarHalf = S.op("push", {
	"direction": "right",
	"style": "bar-resize:screenSizeX/2"
});
var rightBarTwoThirds = S.op("push", {
	"direction": "right",
	"style": "bar-resize:screenSizeX/3*2"
});
var topBarThird = S.op("push", {
	"direction": "top",
	"style": "bar-resize:screenSizeY/3"
});
var topBarHalf = S.op("push", {
	"direction": "top",
	"style": "bar-resize:screenSizeY/2"
});
var topBarTwoThirds = S.op("push", {
	"direction": "top",
	"style": "bar-resize:screenSizeY/3*2"
});
var bottomBarThird = S.op("push", {
	"direction": "bottom",
	"style": "bar-resize:screenSizeY/3"
});
var bottomBarHalf = S.op("push", {
	"direction": "bottom",
	"style": "bar-resize:screenSizeY/2"
});
var bottomBarTwoThirds = S.op("push", {
	"direction": "bottom",
	"style": "bar-resize:screenSizeY/3*2"
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

// Window cycling functions.
var leftCycleOp = getCycleStates(['leftBarHalf', 'leftBarTwoThirds', 'leftBarThird']);
var rightCycleOp = getCycleStates(['rightBarHalf', 'rightBarTwoThirds', 'rightBarThird']);
var topCycleOp = getCycleStates(['topBarHalf', 'topBarTwoThirds', 'topBarThird']);
var bottomCycleOp = getCycleStates(['bottomBarHalf', 'bottomBarTwoThirds', 'bottomBarThird']);

// Bind the window cycling functions.
S.bind('j:ctrl,cmd', leftCycleOp);
S.bind('l:ctrl,cmd', rightCycleOp);
S.bind('i:ctrl,cmd', topCycleOp);
S.bind('k:ctrl,cmd', bottomCycleOp);
