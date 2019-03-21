// create element
function newlabel(el){
  var newDiv = document.createElement("div");
  var newSpan = document.createElement("span");
  newDiv.id = 'wcLabel'
  newSpan.id = "wcSpan"
  el.appendChild(newDiv);
  document.getElementById("wcLabel").appendChild(newSpan)
}

// hover function
function cv_handleHover(item,
                                                           dimension, evt) {
  var el = document.getElementById("wcLabel");
  if (!item) {
    el.setAttribute('hidden', true);

    return;
  }

  el.removeAttribute('hidden');
  // console.log(evt.srcElement.offsetLeft);

  el.style.left = dimension.x + evt.srcElement.offsetLeft + 'px';
  el.style.top = dimension.y + evt.srcElement.offsetTop + 'px';
  el.style.width = dimension.w + 'px';
  el.style.height = dimension.h + 'px';

  this.hoverDimension = dimension;

  document.getElementById("wcSpan").setAttribute(
    'data-l10n-args', JSON.stringify({ word: item[0], count: item[1] }));
  document.getElementById("wcSpan").innerHTML =item[0]+":" + item[1];

};

//mask function
function maskInit(el,x){
  str = x.figBase64;
  var newImg = document.createElement("img");
  newImg.src = str;
  newImg.style.position = 'absolute';
  newImg.style.left = 0;
  // console.log(el.clientHeight);
  newImg.width = el.clientWidth;
  newImg.height = el.clientHeight;
  // maskCanvas = init(el, x, newImg);

  vvalue = 128


  maskCanvas = null;
  // var img = new Image();
  // img.src = x.figBase64;



    maskCanvas = document.createElement('canvas');
    maskCanvas.width = newImg.width;
    maskCanvas.height = newImg.height;

    var ctx = maskCanvas.getContext('2d');
    ctx.drawImage(newImg, 0, 0, newImg.width, newImg.height);

    var imageData = ctx.getImageData(
      0, 0, maskCanvas.width, maskCanvas.height);
    var newImageData = ctx.createImageData(imageData);

    // M = 0
    for (var i = 0; i < imageData.data.length; i += 4) {

      var tone = imageData.data[i] +
        imageData.data[i + 1] +
        imageData.data[i + 2];
      var alpha = imageData.data[i + 3];

      if (alpha < vvalue || tone > vvalue * 3) {
        // Area not to draw
        newImageData.data[i] =
          newImageData.data[i + 1] =
          newImageData.data[i + 2] = 255;
        newImageData.data[i + 3] = 0;
      } else {
        // Area to draw
        newImageData.data[i] =
          newImageData.data[i + 1] =
          newImageData.data[i + 2] = 0;
        newImageData.data[i + 3] = 255;
      }

    }

    ctx.putImageData(newImageData, 0, 0);

  //mask(el, x, maskCanvas);
 var bctx = document.createElement('canvas').getContext('2d');

  bctx.fillStyle = x.backgroundColor || '#fff';
  bctx.fillRect(0, 0, 1, 1);
  var bgPixel = bctx.getImageData(0, 0, 1, 1).data;
  // console.log(bgPixel)
  var maskCanvasScaled =
    document.createElement('canvas');

  maskCanvasScaled.width = el.clientWidth;
  maskCanvasScaled.height = el.clientHeight;
  ctx = maskCanvasScaled.getContext('2d');
  console.log(maskCanvasScaled);
  ctx.drawImage(maskCanvas,
    0, 0, maskCanvas.width, maskCanvas.height,
    0, 0, maskCanvasScaled.width, maskCanvasScaled.height);

  imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);

  newImageData = ctx.createImageData(imageData);
  for (var i = 0; i < imageData.data.length; i += 4) {
    if (imageData.data[i + 3] > vvalue) {
      newImageData.data[i] = bgPixel[0];
      newImageData.data[i + 1] = bgPixel[1];
      newImageData.data[i + 2] = bgPixel[2];
      newImageData.data[i + 3] = bgPixel[3];
    } else {
      // This color must not be the same w/ the bgPixel.
      newImageData.data[i] = bgPixel[0];
      newImageData.data[i + 1] = bgPixel[1];
      newImageData.data[i + 2] = bgPixel[2];
      newImageData.data[i + 3] = bgPixel[3] ? (bgPixel[3] - 1) : 0;
    }
  }

  ctx.putImageData(newImageData, 0, 0);

  ctx = el.firstChild.getContext('2d');
  ctx.drawImage(maskCanvasScaled, 0, 0);

  maskCanvasScaled = ctx = imageData = newImageData = bctx = bgPixel = undefined;


  WordCloud(el.firstChild, { list: listData,
                  fontFamily: x.fontFamily,
                  fontWeight: x.fontWeight,
                  color: x.color,
                  minSize: x.minSize,
                  weightFactor: x.weightFactor,
                  backgroundColor: x.backgroundColor,
                  gridSize: x.gridSize,
                  minRotation: x.minRotation,
                  maxRotation: x.maxRotation,
                  shuffle: x.shuffle,
                  shape: x.shape,
                  rotateRatio: x.rotateRatio,
                  ellipticity: x.ellipticity,
                  clearCanvas: false,
                  hover: x.hover || cv_handleHover,
                  abortThreshold: 3000
                  });
}



//function mask(el,x,maskCanvas){
  // options.clearCanvas = false;

  /* Determine bgPixel by creating
     another canvas and fill the specified background color. */


//}
