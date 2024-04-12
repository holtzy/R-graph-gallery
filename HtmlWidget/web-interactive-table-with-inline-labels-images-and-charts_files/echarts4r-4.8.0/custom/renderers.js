// render error bars and bands
//   the original - works for non-grouped bars only
function renderErrorBar(params, api) {
  var xValue = api.value(0);
  var highPoint = api.coord([xValue, api.value(1)]);
  var lowPoint = api.coord([xValue, api.value(2)]);
  var halfWidth = api.size([1, 0])[0] * 0.1;
  var style = api.style({
      stroke: api.visual('color'),
      fill: null
  });

  return {
      type: 'group',
      children: [{
          type: 'line',
          shape: {
              x1: highPoint[0] - halfWidth, y1: highPoint[1],
              x2: highPoint[0] + halfWidth, y2: highPoint[1]
          },
          style: style
      }, {
          type: 'line',
          shape: {
              x1: highPoint[0], y1: highPoint[1],
              x2: lowPoint[0], y2: lowPoint[1]
          },
          style: style
      }, {
          type: 'line',
          shape: {
              x1: lowPoint[0] - halfWidth, y1: lowPoint[1],
              x2: lowPoint[0] + halfWidth, y2: lowPoint[1]
          },
          style: style
      }]
  };
}

	
/*
  added support for grouped bars, barGap and barCategoryGap by helgasoft.com
	To test in R:
  grps <- 5; rpt <- grps*2
  df <- data.frame('Category' = c(rep(LETTERS[1:grps], each=rpt)),
    'Xaxis' = rep(paste(rep(LETTERS[1:grps], each=2), 1:grps*2, sep='.'), grps*rpt/(grps*2)), 
    'Yaxis' = 50 * abs(rnorm(grps*rpt))) %>%
    mutate(Lower = Yaxis - 5 * runif(grps*rpt),
           Upper = Yaxis + 5 * runif(grps*rpt))
  df %>% group_by(Category) %>% 
    e_charts(Xaxis) %>% 
    e_bar(Yaxis) %>%  #, barGap ='22%', barCategoryGap='55%') %>%
    e_error_bar(Lower, Upper) %>%
    e_datazoom(start = 50)
*/
function renderErrorBar2(params, api) {

  // oss is [last.barGap, last.barCategoryGap, totSeries]
  let oss = JSON.parse(sessionStorage.getItem('ErrorBar.oss'));
  if (oss===null || !Object.keys(oss).length) return null;   // cant work without it

  let totSeries = Number(oss[2]);

  let xValue = api.value(0);
  let highPoint = api.coord([xValue, api.value(1)]);
  let lowPoint = api.coord([xValue, api.value(2)]);
  let halfWidth = api.size([1, 0])[0] * 0.1;
	
  let csil = api.currentSeriesIndices().length / 2;
	// idx is index of related main bar
  let idx = params.seriesIndex - (params.seriesIndex < totSeries ? 0 : totSeries);	

  if (csil > 1 && totSeries > 1) {
  	let bgm = oss[0];
  	let bcgm = oss[1];
  	let olay = { count: csil };
  	olay.barGap = bgm!=='' ? bgm : '30%';		// '30%' is default for e_bar
  	olay.barCategoryGap = bcgm!=='' ? bcgm : '20%';
  	let barLayouts = api.barLayout(olay);		// will be csil # of barLayouts
  	
  	if (barLayouts) {
	  	let mbar = 0;
	  	api.currentSeriesIndices().some( (item, index) => {
	  		if (item == idx) {
	  			highPoint[0] += barLayouts[mbar].offsetCenter;
	  			halfWidth = barLayouts[mbar].width /2;
	  			return true;
	  		}
	  		mbar++;
	  		return mbar >= csil;  // false until true
	  	});
  	}
  }
  lowPoint[0] = highPoint[0];
  
  var style = api.style({
      stroke: api.visual('color'),
      fill: null
  });
  return {
      type: 'group',
      children: [{
          type: 'line',
          shape: {
              x1: highPoint[0] - halfWidth, y1: highPoint[1],
              x2: highPoint[0] + halfWidth, y2: highPoint[1]
          },
          style: style
      }, {
          type: 'line',		// vertical
          shape: {
              x1: highPoint[0], y1: highPoint[1],
              x2: lowPoint[0], y2: lowPoint[1]
          },
          style: style
      }, {
          type: 'line',
          shape: {
              x1: lowPoint[0] - halfWidth, y1: lowPoint[1],
              x2: lowPoint[0] + halfWidth, y2: lowPoint[1]
          },
          style: style
      }]
  };
}


// renderer for e_band2
function renderBand(params, api) {
    if (params.context.rendered) return;
    params.context.rendered = true;
    
    // set polygon vertices
    let points = [];
    let i = 0;
    while (typeof api.value(0,i) != 'undefined' && !isNaN(api.value(0,i))) {
    	points.push(api.coord([api.value(0,i), api.value(1,i)]));  // lo
    	i++;
    }
    for (var k = i-1; k > -1 ; k--) {
        points.push(api.coord([api.value(0,k), api.value(2,k)]));  // up
    }
    var color = api.visual('color');

    return {
        type: 'polygon',
        shape: {
            points: echarts.graphic.clipPointsByRect(points, {
                x: params.coordSys.x,
                y: params.coordSys.y,
                width: params.coordSys.width,
                height: params.coordSys.height
            })
        },
        style: api.style({
            fill: color,
            stroke: echarts.color.lift(color)
        })
    };
}

function renderBarWidth(params, api) {
    var yValue = api.value(2);
    var start = api.coord([api.value(0), yValue]);
    var size = api.size([api.value(1) - api.value(0), yValue]);
    var style = api.style();

    return {
        type: 'rect',
        shape: {
            x: start[0],
            y: start[1],
            width: size[0],
            height: size[1]
        },
        style: style
    };
}
