
(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['exports', 'echarts'], factory);
    } else if (typeof exports === 'object' && typeof exports.nodeName !== 'string') {
        // CommonJS
        factory(exports, require('echarts'));
    } else {
        // Browser globals
        factory({}, root.echarts);
    }
}(this, function (exports, echarts) {
    var log = function (msg) {
        if (typeof console !== 'undefined') {
            console && console.error && console.error(msg);
        }
    };
    if (!echarts) {
        log('ECharts is not Loaded');
        return;
    }
    echarts.registerTheme('auritus', {
        "color": [
            "rgba(52,73,94,0.87)",
            "rgba(193,0,7,0.87)",
            "rgba(234,164,0,0.87)",
            "rgba(4,143,75,0.87)",
            "rgba(216,97,0,0.87)",
            "rgba(86,73,150,0.87)"
        ],
        "backgroundColor": "rgba(0, 0, 0, 0)",
        "textStyle": {},
        "title": {
            "textStyle": {
                "color": "#34495e"
            },
            "subtextStyle": {
                "color": "#a3a3a3"
            }
        },
        "line": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "1"
                }
            },
            "lineStyle": {
                "normal": {
                    "width": "3"
                }
            },
            "symbolSize": "5",
            "symbol": "emptyCircle",
            "smooth": false
        },
        "radar": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "1"
                }
            },
            "lineStyle": {
                "normal": {
                    "width": "3"
                }
            },
            "symbolSize": "5",
            "symbol": "emptyCircle",
            "smooth": false
        },
        "bar": {
            "itemStyle": {
                "normal": {
                    "barBorderWidth": 0,
                    "barBorderColor": "#ccc"
                },
                "emphasis": {
                    "barBorderWidth": 0,
                    "barBorderColor": "#ccc"
                }
            }
        },
        "pie": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                },
                "emphasis": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            }
        },
        "scatter": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                },
                "emphasis": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            }
        },
        "boxplot": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                },
                "emphasis": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            }
        },
        "parallel": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                },
                "emphasis": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            }
        },
        "sankey": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                },
                "emphasis": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            }
        },
        "funnel": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                },
                "emphasis": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            }
        },
        "gauge": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                },
                "emphasis": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            }
        },
        "candlestick": {
            "itemStyle": {
                "normal": {
                    "color": "#c10007",
                    "color0": "#34495e",
                    "borderColor": "#c10007",
                    "borderColor0": "#34495e",
                    "borderWidth": 1
                }
            }
        },
        "graph": {
            "itemStyle": {
                "normal": {
                    "borderWidth": 0,
                    "borderColor": "#ccc"
                }
            },
            "lineStyle": {
                "normal": {
                    "width": 1,
                    "color": "#aaa"
                }
            },
            "symbolSize": "5",
            "symbol": "emptyCircle",
            "smooth": false,
            "color": [
                "rgba(52,73,94,0.87)",
                "rgba(193,0,7,0.87)",
                "rgba(234,164,0,0.87)",
                "rgba(4,143,75,0.87)",
                "rgba(216,97,0,0.87)",
                "rgba(86,73,150,0.87)"
            ],
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#eee"
                    }
                }
            }
        },
        "map": {
            "itemStyle": {
                "normal": {
                    "areaColor": "#eee",
                    "borderColor": "#34495e",
                    "borderWidth": "0.3"
                },
                "emphasis": {
                    "areaColor": "rgba(193,0,7,0.29)",
                    "borderColor": "#c10007",
                    "borderWidth": "1.5"
                }
            },
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#000000"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "#34495e"
                    }
                }
            }
        },
        "geo": {
            "itemStyle": {
                "normal": {
                    "areaColor": "#eee",
                    "borderColor": "#34495e",
                    "borderWidth": "0.3"
                },
                "emphasis": {
                    "areaColor": "rgba(193,0,7,0.29)",
                    "borderColor": "#c10007",
                    "borderWidth": "1.5"
                }
            },
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#000000"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "#34495e"
                    }
                }
            }
        },
        "categoryAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#a3a3a3"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#a3a3a3"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(255,255,255,0)",
                        "rgba(200,200,200,0.3)"
                    ]
                }
            }
        },
        "valueAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#a3a3a3"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#a3a3a3"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(255,255,255,0)",
                        "rgba(200,200,200,0.3)"
                    ]
                }
            }
        },
        "logAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#a3a3a3"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#a3a3a3"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(255,255,255,0)",
                        "rgba(200,200,200,0.3)"
                    ]
                }
            }
        },
        "timeAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#a3a3a3"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#a3a3a3"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#a3a3a3"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(255,255,255,0)",
                        "rgba(200,200,200,0.3)"
                    ]
                }
            }
        },
        "toolbox": {
            "iconStyle": {
                "normal": {
                    "borderColor": "#a3a3a3"
                },
                "emphasis": {
                    "borderColor": "#c10007"
                }
            }
        },
        "legend": {
            "textStyle": {
                "color": "#333333"
            }
        },
        "tooltip": {
            "axisPointer": {
                "lineStyle": {
                    "color": "#d6d1d1",
                    "width": ".5"
                },
                "crossStyle": {
                    "color": "#d6d1d1",
                    "width": ".5"
                }
            }
        },
        "timeline": {
            "lineStyle": {
                "color": "#34495e",
                "width": 1
            },
            "itemStyle": {
                "normal": {
                    "color": "#34495e",
                    "borderWidth": 1
                },
                "emphasis": {
                    "color": "rgba(193,0,7,0.64)"
                }
            },
            "controlStyle": {
                "normal": {
                    "color": "#34495e",
                    "borderColor": "#34495e",
                    "borderWidth": 0.5
                },
                "emphasis": {
                    "color": "#34495e",
                    "borderColor": "#34495e",
                    "borderWidth": 0.5
                }
            },
            "checkpointStyle": {
                "color": "#c10007",
                "borderColor": "rgba(193,0,7,0.3)"
            },
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "rgba(52,73,94,0.85)"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "rgba(52,73,94,0.85)"
                    }
                }
            }
        },
        "visualMap": {
            "color": [
                "#516d8a",
                "#8adbdb"
            ]
        },
        "dataZoom": {
            "backgroundColor": "rgba(0,0,0,0)",
            "dataBackgroundColor": "rgba(52,73,94,0.4)",
            "fillerColor": "rgba(52,73,94,0.4)",
            "handleColor": "rgba(193,0,7,0.94)",
            "handleSize": "100%",
            "textStyle": {
                "color": "#34495e"
            }
        },
        "markPoint": {
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#eee"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "#eee"
                    }
                }
            }
        }
    });
}));
