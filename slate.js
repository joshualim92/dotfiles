S.configAll({
  defaultToCurrentScreen: true,
  nudgePercentOf: "screenSize",
  resizePercentOf: "screenSize",
  windowHintsIgnoreHiddenWindows: true,
  windowHintsShowIcons: false,
  windowHintsSpread: true
});

// Store current window states.
var windowStates = {};

var full = S.op("move", {
  x: "screenOriginX",
  y: "screenOriginY",
  width: "screenSizeX",
  height: "screenSizeY"
});
var center = S.op("move", {
  x: "screenOriginX+((screenSizeX-windowSizeX)/2)",
  y: "screenOriginY+((screenSizeY-windowSizeY)/2)",
  width: "windowSizeX",
  height: "windowSizeY"
});
// Left
var leftBarThird = S.op("push", {
  direction: "left",
  style: "bar-resize:screenSizeX/3"
});
var leftBarHalf = S.op("push", {
  direction: "left",
  style: "bar-resize:screenSizeX/2"
});
var leftBarTwoThirds = S.op("push", {
  direction: "left",
  style: "bar-resize:screenSizeX/3*2"
});
// Right
var rightBarThird = S.op("push", {
  direction: "right",
  style: "bar-resize:screenSizeX/3"
});
var rightBarHalf = S.op("push", {
  direction: "right",
  style: "bar-resize:screenSizeX/2"
});
var rightBarTwoThirds = S.op("push", {
  direction: "right",
  style: "bar-resize:screenSizeX/3*2"
});
// // Top
// var topBarThird = S.op('push', {
// 	'direction': 'top',
// 	'style': 'bar-resize:screenSizeY/3',
// });
// var topBarHalf = S.op('push', {
// 	'direction': 'top',
// 	'style': 'bar-resize:screenSizeY/2',
// });
// var topBarTwoThirds = S.op('push', {
// 	'direction': 'top',
// 	'style': 'bar-resize:screenSizeY/3*2',
// });
// // Bottom
// var bottomBarThird = S.op('push', {
// 	'direction': 'bottom',
// 	'style': 'bar-resize:screenSizeY/3',
// });
// var bottomBarHalf = S.op('push', {
// 	'direction': 'bottom',
// 	'style': 'bar-resize:screenSizeY/2',
// });
// var bottomBarTwoThirds = S.op('push', {
// 	'direction': 'bottom',
// 	'style': 'bar-resize:screenSizeY/3*2',
// });
// // Top Left
// var topLeftCorner = S.op('corner', {
// 	'direction': 'top-left',
// 	'width': 'screenSizeX/2',
// 	'height': 'screenSizeY/2',
// });
// var topLeftTwoThird = S.op('corner', {
// 	'direction': 'top-left',
// 	'width': 'screenSizeX/3*2',
// 	'height': 'screenSizeY/3*2',
// });
// var topLeftThird = S.op('corner', {
// 	'direction': 'top-left',
// 	'width': 'screenSizeX/3',
// 	'height': 'screenSizeY/3',
// });
// // Top Right
// var topRightCorner = S.op('corner', {
// 	'direction': 'top-right',
// 	'width': 'screenSizeX/2',
// 	'height': 'screenSizeY/2',
// });
// var topRightTwoThird = S.op('corner', {
// 	'direction': 'top-right',
// 	'width': 'screenSizeX/3*2',
// 	'height': 'screenSizeY/3*2',
// });
// var topRightThird = S.op('corner', {
// 	'direction': 'top-right',
// 	'width': 'screenSizeX/3',
// 	'height': 'screenSizeY/3',
// });
// // Bottom Left
// var bottomLeftCorner = S.op('corner', {
// 	'direction': 'bottom-left',
// 	'width': 'screenSizeX/2',
// 	'height': 'screenSizeY/2',
// });
// var bottomLeftTwoThird = S.op('corner', {
// 	'direction': 'bottom-left',
// 	'width': 'screenSizeX/3*2',
// 	'height': 'screenSizeY/3*2',
// });
// var bottomLeftThird = S.op('corner', {
// 	'direction': 'bottom-left',
// 	'width': 'screenSizeX/3',
// 	'height': 'screenSizeY/3',
// });
// // Bottom Right
// var bottomRightCorner = S.op('corner', {
// 	'direction': 'bottom-right',
// 	'width': 'screenSizeX/2',
// 	'height': 'screenSizeY/2',
// });
// var bottomRightTwoThird = S.op('corner', {
// 	'direction': 'bottom-right',
// 	'width': 'screenSizeX/3*2',
// 	'height': 'screenSizeY/3*2',
// });
// var bottomRightThird = S.op('corner', {
// 	'direction': 'bottom-right',
// 	'width': 'screenSizeX/3',
// 	'height': 'screenSizeY/3',
// });

function getCycleStates(states) {
  return function(win) {
    if (
      win.pid in windowStates &&
      windowStates[win.pid] !== undefined &&
      states.indexOf(windowStates[win.pid]) !== -1
    ) {
      var potentialNextIndex = states.indexOf(windowStates[win.pid]) + 1;
      var nextIndex =
        potentialNextIndex >= states.length ? 0 : potentialNextIndex;
      windowStates[win.pid] = states[nextIndex];
    } else {
      windowStates[win.pid] = states[0];
    }

    eval(windowStates[win.pid] + ".run()");
  };
}

// Window cycling functions
var fullCycleOp = getCycleStates(["full"]);
var centerCycleOp = getCycleStates(["center"]);
var leftCycleOp = getCycleStates([
  "leftBarHalf",
  "leftBarTwoThirds",
  "leftBarThird"
]);
var rightCycleOp = getCycleStates([
  "rightBarHalf",
  "rightBarTwoThirds",
  "rightBarThird"
]);
// var topCycleOp = getCycleStates([
//   "topBarHalf",
//   "topBarTwoThirds",
//   "topBarThird"
// ]);
// var bottomCycleOp = getCycleStates([
//   "bottomBarHalf",
//   "bottomBarTwoThirds",
//   "bottomBarThird"
// ]);
// var topLeftCornerCycleOp = getCycleStates([
//   "topLeftCorner",
//   "topLeftTwoThird",
//   "topLeftThird"
// ]);
// var topRightCornerCycleOp = getCycleStates([
//   "topRightCorner",
//   "topRightTwoThird",
//   "topRightThird"
// ]);
// var bottomLeftCornerCycleOp = getCycleStates([
//   "bottomLeftCorner",
//   "bottomLeftTwoThird",
//   "bottomLeftThird"
// ]);
// var bottomRightCornerCycleOp = getCycleStates([
//   "bottomRightCorner",
//   "bottomRightTwoThird",
//   "bottomRightThird"
// ]);

// // 1/8th grids
// var topLeftSubLeft = S.op("move", {
//   x: "screenOriginX",
//   y: "screenOriginY",
//   width: "windowSizeX",
//   height: "windowSizeY"
// });
// var topLeftSubRight = S.op("move", {
//   x: "screenOriginX+screenSizeX/4",
//   y: "screenOriginY",
//   width: "screenSizeX/4",
//   height: "windowSizeY"
// });
// var topRightSubLeft = S.op("move", {
//   x: "screenOriginX+screenSizeX/2",
//   y: "screenOriginY",
//   width: "screenSizeX/4",
//   height: "windowSizeY"
// });
// var topRightSubRight = S.op("move", {
//   x: "screenOriginX+screenSizeX/4*3",
//   y: "screenOriginY",
//   width: "screenSizeX/4",
//   height: "windowSizeY"
// });
// var bottomLeftSubLeft = S.op("move", {
//   x: "screenOriginX",
//   y: "screenOriginY+screenSizeY-windowSizeY",
//   width: "screenSizeX/4",
//   height: "windowSizeY"
// });
// var bottomLeftSubRight = S.op("move", {
//   x: "screenOriginX+screenSizeX/4",
//   y: "screenOriginY+screenSizeY-windowSizeY",
//   width: "screenSizeX/4",
//   height: "windowSizeY"
// });
// var bottomRightSubLeft = S.op("move", {
//   x: "screenOriginX+screenSizeX/2",
//   y: "screenOriginY+screenSizeY-windowSizeY",
//   width: "screenSizeX/4",
//   height: "windowSizeY"
// });
// var bottomRightSubRight = S.op("move", {
//   x: "screenOriginX+screenSizeX/4 * 3",
//   y: "screenOriginY+screenSizeY-windowSizeY",
//   width: "screenSizeX/4",
//   height: "windowSizeY"
// });

// var topLeftCycleOp = getCycleStates(["topLeftSubLeft", "topLeftSubRight"]);
// var topRightCycleOp = getCycleStates(["topRightSubLeft", "topRightSubRight"]);
// var bottomLeftCycleOp = getCycleStates([
//   "bottomLeftSubLeft",
//   "bottomLeftSubRight"
// ]);
// var bottomRightCycleOp = getCycleStates([
//   "bottomRightSubLeft",
//   "bottomRightSubRight"
// ]);

// Push bindings
S.bind("j:ctrl,cmd", leftCycleOp);
S.bind("l:ctrl,cmd", rightCycleOp);
// S.bind("i:ctrl,cmd", topCycleOp);
// S.bind(",:ctrl,cmd", bottomCycleOp);
// S.bind("u:ctrl,cmd", topLeftCornerCycleOp);
// S.bind("o:ctrl,cmd", topRightCornerCycleOp);
// S.bind("m:ctrl,cmd", bottomLeftCornerCycleOp);
// S.bind(".:ctrl,cmd", bottomRightCornerCycleOp);
// S.bind("y:ctrl,cmd", topLeftCycleOp);
// S.bind("p:ctrl,cmd", topRightCycleOp);
// S.bind("n:ctrl,cmd", bottomLeftCycleOp);
// S.bind("/:ctrl,cmd", bottomRightCycleOp);
S.bind("k:ctrl,cmd", centerCycleOp);
S.bind(";:ctrl,cmd", fullCycleOp);

// Throw bindings
// S.bind(
//   "j:ctrl;alt;cmd",
//   S.op("throw", {
//     screen: "left",
//     width: "screenSizeX",
//     height: "screenSizeY"
//   })
// );
// S.bind(
//   "i:ctrl;alt;cmd",
//   S.op("throw", {
//     screen: "up",
//     width: "screenSizeX",
//     height: "screenSizeY"
//   })
// );
// S.bind(
//   "l:ctrl;alt;cmd",
//   S.op("throw", {
//     screen: "right",
//     width: "screenSizeX",
//     height: "screenSizeY"
//   })
// );
// S.bind(
//   ",:ctrl;alt;cmd",
//   S.op("throw", {
//     screen: "below",
//     width: "screenSizeX",
//     height: "screenSizeY"
//   })
// );
// S.bind("k:ctrl;alt;cmd", full);
// S.bind(";:ctrl;alt;cmd", full);

// Focus bindings
// S.bind("j:ctrl;alt", S.op("focus", { direction: "left" }));
// S.bind("i:ctrl;alt", S.op("focus", { direction: "up" }));
// S.bind("l:ctrl;alt", S.op("focus", { direction: "right" }));
// S.bind(",:ctrl;alt", S.op("focus", { direction: "down" }));

// Hint binding
// var hintChars = "JKLASDFGH";
// S.bind("space:ctrl;cmd", S.op("hint", { characters: hintChars }));
// S.bind("space:ctrl;alt", S.op("hint", { characters: hintChars }));
