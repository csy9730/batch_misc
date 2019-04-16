# javascript

### datatype

##### list
list aa
aa.push(a)
aa.splice(0,1)

### misc

Math.random()
Math.cos()
Math.abs()
Math.max()

```javascript
function sfAxisPoint2WH(x,y)
{
    var rctBottom = -100
    var rctTop = 100
    var rctLeft = 0
    var rctRight = maxLen

    var rct2Bottom = canvas.height - marginY
    var rct2Top = canvas.height - marginY - rct2H
    var rct2Left = marginX
    var rct2Right = marginX+spacing*maxLen

    var  yRatio = (y - rctBottom )/( rctTop - rctBottom );//归一化
    var  xRatio = (x - rctLeft)/( rctRight - rctLeft);//归一化
    var wRatio=xRatio;
    var hRatio=1-yRatio;//
    var w=wRatio*( rct2Right - rct2Left ) + rct2Left ;
    //h=hRatio*(rct2.top-rct2.bottom) +rct2.bottom ;
    var h=hRatio*(rct2Bottom - rct2Top) + rct2Top ;
    return  [w,h];
}
```