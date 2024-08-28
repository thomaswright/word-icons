// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Core__Array from "@rescript/core/src/Core__Array.res.mjs";
import * as Core__Float from "@rescript/core/src/Core__Float.res.mjs";
import * as Core__Option from "@rescript/core/src/Core__Option.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";

function getCharWidth(c) {
  switch (c) {
    case " " :
    case "i" :
    case "l" :
        return 1;
    case "f" :
    case "r" :
    case "t" :
        return 2;
    case "m" :
    case "w" :
        return 4;
    default:
      return 3;
  }
}

function App(props) {
  var match = React.useState(function () {
        return 0.1;
      });
  var setValueA = match[1];
  var valueA = match[0];
  var match$1 = React.useState(function () {
        return 1.4;
      });
  var setValueB = match$1[1];
  var valueB = match$1[0];
  var match$2 = React.useState(function () {
        return 0.4;
      });
  var setValueC = match$2[1];
  var valueC = match$2[0];
  var getScaler = function (text) {
    var textChars = text.split("");
    var textMeasure = Core__Array.reduce(textChars, 0, (function (acc, c) {
            return acc + getCharWidth(c) | 0;
          }));
    return valueA / Math.pow(textMeasure + valueB, valueC);
  };
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: valueA.toString(),
                                      className: "w-5"
                                    }),
                                JsxRuntime.jsx("input", {
                                      max: "0.15",
                                      min: "0",
                                      step: 0.001,
                                      type: "range",
                                      value: valueA.toString(),
                                      onChange: (function (e) {
                                          setValueA(function (v) {
                                                return Core__Option.getOr(Core__Float.fromString(e.target.value), v);
                                              });
                                        })
                                    })
                              ]
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: valueB.toString(),
                                      className: "w-5"
                                    }),
                                JsxRuntime.jsx("input", {
                                      max: "5",
                                      min: "0",
                                      step: 0.01,
                                      type: "range",
                                      value: valueB.toString(),
                                      onChange: (function (e) {
                                          setValueB(function (v) {
                                                return Core__Option.getOr(Core__Float.fromString(e.target.value), v);
                                              });
                                        })
                                    })
                              ]
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: valueC.toString(),
                                      className: "w-5"
                                    }),
                                JsxRuntime.jsx("input", {
                                      max: "2",
                                      min: "0",
                                      step: 0.01,
                                      type: "range",
                                      value: valueC.toString(),
                                      onChange: (function (e) {
                                          setValueC(function (v) {
                                                return Core__Option.getOr(Core__Float.fromString(e.target.value), v);
                                              });
                                        })
                                    })
                              ]
                            })
                      ],
                      className: "flex flex-col w-80"
                    }),
                JsxRuntime.jsx("div", {
                      children: [
                          "Settings",
                          "Delete",
                          "Hang Up",
                          "i",
                          "Menu",
                          "Home",
                          "Zoom",
                          "back",
                          "Ask Question",
                          "Something extra extra long"
                        ].map(function (text) {
                            var scaler = getScaler(text);
                            return JsxRuntime.jsx("div", {
                                        children: JsxRuntime.jsx("div", {
                                              children: text,
                                              style: {
                                                fontSize: (scaler * 60).toString() + "rem",
                                                fontWeight: "900",
                                                height: (60).toString() + "px",
                                                letterSpacing: "-0.05em",
                                                lineHeight: "0.6",
                                                textAlign: "center",
                                                width: (60).toString() + "px",
                                                overflowWrap: "break-word"
                                              }
                                            }),
                                        className: " p-2 border rounded m-2 border-gray-300 shadow w-fit"
                                      });
                          }),
                      className: "flex flex-row max-w-lg flex-wrap"
                    })
              ],
              className: "p-6"
            });
}

var make = App;

export {
  make ,
}
/* react Not a pure module */
