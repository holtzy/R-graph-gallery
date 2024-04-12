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
  echarts.registerTheme('wef', {
    "color": [
      "#1c62b7",
      "#c7c7c7",
      "#287ecb",
      "#9c9a9b",
      "#469ada",
      "#7b797a",
      "#73c0ec",
      "#4e4c4d"
      ],
    "backgroundColor": "rgba(0, 0, 0, 0)",
    "textStyle": {},
    "title": {
      "textStyle": {
        "color": "#4e4c4d"
      },
      "subtextStyle": {
        "color": "#7b797a"
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
          "width": "2"
        }
      },
      "symbolSize": "4",
      "symbol": "none",
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
          "width": "2"
        }
      },
      "symbolSize": "4",
      "symbol": "circle",
      "smooth": false
    },
    "bar": {
      "itemStyle": {
        "normal": {
          "barBorderWidth": "0",
          "barBorderColor": "#c7c7c7"
        },
        "emphasis": {
          "barBorderWidth": "0",
          "barBorderColor": "#c7c7c7"
        }
      }
    },
    "pie": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        },
        "emphasis": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      }
    },
    "scatter": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        },
        "emphasis": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      }
    },
    "boxplot": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        },
        "emphasis": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      }
    },
    "parallel": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        },
        "emphasis": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      }
    },
    "sankey": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        },
        "emphasis": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      }
    },
    "funnel": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        },
        "emphasis": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      }
    },
    "gauge": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        },
        "emphasis": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      }
    },
    "candlestick": {
      "itemStyle": {
        "normal": {
          "color": "#df6c7d",
          "color0": "#6ca886",
          "borderColor": "#df6c7d",
          "borderColor0": "#6ca886",
          "borderWidth": "3"
        }
      }
    },
    "graph": {
      "itemStyle": {
        "normal": {
          "borderWidth": "0",
          "borderColor": "#c7c7c7"
        }
      },
      "lineStyle": {
        "normal": {
          "width": 1,
          "color": "#9c9a9b"
        }
      },
      "symbolSize": "4",
      "symbol": "circle",
      "smooth": false,
      "color": [
        "#1c62b7",
        "#c7c7c7",
        "#287ecb",
        "#9c9a9b",
        "#469ada",
        "#7b797a",
        "#73c0ec",
        "#4e4c4d"
        ],
      "label": {
        "normal": {
          "textStyle": {
            "color": "#eeeeee"
          }
        }
      }
    },
    "map": {
      "itemStyle": {
        "normal": {
          "areaColor": "#e5e5e5",
          "borderColor": "#4e4c4d",
          "borderWidth": "0.3"
        },
        "emphasis": {
          "areaColor": "#ffffff",
          "borderColor": "#1c62b7",
          "borderWidth": "0.75"
        }
      },
      "label": {
        "normal": {
          "textStyle": {
            "color": "#4e4c4d"
          }
        },
        "emphasis": {
          "textStyle": {
            "color": "#637599"
          }
        }
      }
    },
    "geo": {
      "itemStyle": {
        "normal": {
          "areaColor": "#e5e5e5",
          "borderColor": "#4e4c4d",
          "borderWidth": "0.3"
        },
        "emphasis": {
          "areaColor": "#ffffff",
          "borderColor": "#1c62b7",
          "borderWidth": "0.75"
        }
      },
      "label": {
        "normal": {
          "textStyle": {
            "color": "#4e4c4d"
          }
        },
        "emphasis": {
          "textStyle": {
            "color": "#637599"
          }
        }
      }
    },
    "categoryAxis": {
      "axisLine": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisTick": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisLabel": {
        "show": true,
        "textStyle": {
          "color": "#4e4c4d"
        }
      },
      "splitLine": {
        "show": false,
        "lineStyle": {
          "color": [
            "#ccc"
            ]
        }
      },
      "splitArea": {
        "show": false,
        "areaStyle": {
          "color": [
            "rgba(250,250,250,0.3)",
            "rgba(200,200,200,0.3)"
            ]
        }
      }
    },
    "valueAxis": {
      "axisLine": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisTick": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisLabel": {
        "show": true,
        "textStyle": {
          "color": "#4e4c4d"
        }
      },
      "splitLine": {
        "show": true,
        "lineStyle": {
          "color": [
            "#c7c7c7"
            ]
        }
      },
      "splitArea": {
        "show": false,
        "areaStyle": {
          "color": [
            "rgba(250,250,250,0.3)",
            "rgba(200,200,200,0.3)"
            ]
        }
      }
    },
    "logAxis": {
      "axisLine": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisTick": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisLabel": {
        "show": true,
        "textStyle": {
          "color": "#c7c7c7"
        }
      },
      "splitLine": {
        "show": true,
        "lineStyle": {
          "color": [
            "#c7c7c7"
            ]
        }
      },
      "splitArea": {
        "show": false,
        "areaStyle": {
          "color": [
            "rgba(250,250,250,0.3)",
            "rgba(200,200,200,0.3)"
            ]
        }
      }
    },
    "timeAxis": {
      "axisLine": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisTick": {
        "show": true,
        "lineStyle": {
          "color": "#4e4c4d"
        }
      },
      "axisLabel": {
        "show": true,
        "textStyle": {
          "color": "#333"
        }
      },
      "splitLine": {
        "show": true,
        "lineStyle": {
          "color": [
            "#c7c7c7"
            ]
        }
      },
      "splitArea": {
        "show": false,
        "areaStyle": {
          "color": [
            "rgba(250,250,250,0.3)",
            "rgba(200,200,200,0.3)"
            ]
        }
      }
    },
    "toolbox": {
      "iconStyle": {
        "normal": {
          "borderColor": "#7b797a"
        },
        "emphasis": {
          "borderColor": "#4e4c4d"
        }
      }
    },
    "legend": {
      "textStyle": {
        "color": "#4e4c4d"
      }
    },
    "tooltip": {
      "axisPointer": {
        "lineStyle": {
          "color": "#9c9a9b",
          "width": "1"
        },
        "crossStyle": {
          "color": "#9c9a9b",
          "width": "1"
        }
      }
    },
    "timeline": {
      "lineStyle": {
        "color": "#4e4c4d",
        "width": "2"
      },
      "itemStyle": {
        "normal": {
          "color": "#4e4c4d",
          "borderWidth": 1
        },
        "emphasis": {
          "color": "#1c62b7"
        }
      },
      "controlStyle": {
        "normal": {
          "color": "#4e4c4d",
          "borderColor": "#4e4c4d",
          "borderWidth": "0.5"
        },
        "emphasis": {
          "color": "#4e4c4d",
          "borderColor": "#4e4c4d",
          "borderWidth": "0.5"
        }
      },
      "checkpointStyle": {
        "color": "#287ecb",
        "borderColor": "rgba(194,53,49,0.5)"
      },
      "label": {
        "normal": {
          "textStyle": {
            "color": "#4e4c4d"
          }
        },
        "emphasis": {
          "textStyle": {
            "color": "#4e4c4d"
          }
        }
      }
    },
    "visualMap": {
      "color": [
        "#1c62b7",
        "#287ecb",
        "#73c0ec"
        ]
    },
    "dataZoom": {
      "backgroundColor": "transparent",
      "dataBackgroundColor": "#c7c7c7",
      "fillerColor": "rgba(156,154,155,0.4)",
      "handleColor": "#9c9a9b",
      "handleSize": "100%",
      "textStyle": {
        "color": "#4e4c4d"
      }
    },
    "markPoint": {
      "label": {
        "normal": {
          "textStyle": {
            "color": "#eeeeee"
          }
        },
        "emphasis": {
          "textStyle": {
            "color": "#eeeeee"
          }
        }
      }
    }
  });
}));