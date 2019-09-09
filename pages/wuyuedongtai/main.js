
// 计算每秒客流增量
var linspace = function (start, end, length) {
    var step = (end - start) / (length - 1);
    var arr = [];
    for (var i = 0; i < length; i++) {
        arr.push(start + step * i);
    }
    return arr;
};

var zfill = function (v, n) {
    var prefix = '';
    var sv = v.toString();
    if (sv.length < n) {
        for (var i = 0; i < n - sv.length; i++) {
            prefix += '0';
        }
    }
    return prefix + sv;
}

var getDayType = function () {
    var specialHolidays = ['2018-04-05', '2018-04-06', '2018-04-30', '2018-05-01', '2018-06-18', '2018-09-24', '2018-10-01', '2018-10-02', '2018-10-03', '2018-10-03', '2018-10-04', '2018-10-05']
    var specialWorkdays = ['2018-04-08', '2018-04-28', '2018-09-29', '2018-09-30']
    var d = new Date();
    var date = d.getFullYear() + '-' + zfill(d.getMonth() + 1, 2) + '-' + zfill(d.getDate(), 2);
    var w = d.getDay();
    if (specialHolidays.indexOf(date) >= 0) {
        return 'weekend';
    }
    else if (specialWorkdays.indexOf(date) >= 0) {
        return 'workday';
    }
    else if (w == 0 || w == 6) {
        return 'weekend';
    }
    else {
        return 'workday';
    }
};
var data = function () {
    var speedLine = params.speedLine;
    var dateType = getDayType();
    var cumSpeedPerPlaza = params.cumSpeedPerPlaza[dateType]; // TODO 日期
    var rtSpeedPerPlaza = params.rtSpeedPerPlaza[dateType];
    var amountPerPlaza = params.amountPerPlaza[dateType];

    var totalSeconds = (params.inServiceTime[1] - params.inServiceTime[0]) * 3600;
    // 插值
    length = totalSeconds / (speedLine.length - 1); // 插值数
    var arr = [];
    for (var i = 0; i < speedLine.length - 1; i++) {
        parts = linspace(speedLine[i], speedLine[i + 1], length);
        arr = arr.concat(parts);
    }
    arr = arr.slice(0, totalSeconds);
    var sumArr = arr.reduce(function (d, r) { return r + d; }, 0);
    var ratio = cumSpeedPerPlaza * params.inServiceCnt / sumArr;
    var cumArr = arr.map(function (d) { return Math.round(d * ratio); }); // 累积客流量

    var max = speedLine.reduce(function (d, r) { return Math.max(r, d); }, 0);
    var min = speedLine.reduce(function (d, r) { return Math.min(r, d); }, max);

    var ratioRT = 0;
    if (max - min > 0) {
        ratioRT = (rtSpeedPerPlaza.max - rtSpeedPerPlaza.min) / (max - min);
    }
    var rtArr = arr.map(function (d) { return params.inServiceCnt * (rtSpeedPerPlaza.min + ratioRT * (d - min)); })


    var ratioAmount = amountPerPlaza * params.inServiceCnt / sumArr;
    var amountArr = arr.map(function (d) { return d * ratioAmount; }); // 累积客流量 
    return { cumArr: cumArr, rtArr: rtArr, amountArr: amountArr };
}();
// 计算指定时刻的 
var getNowIndex = function () {
    var d = new Date();
    var hour = d.getHours();
    var minute = d.getMinutes();
    var second = d.getSeconds();
    if (hour < params.inServiceTime[0]) {
        return -1;
    }
    else if (hour >= params.inServiceTime[1]) {
        return 3600 * (params.inServiceTime[1] - params.inServiceTime[0]);
    }
    else {
        return (hour - params.inServiceTime[0]) * 3600 + minute * 60 + second;
    }
};


$("#plazaCnt").html(params.plazaCnt + '');
$("#cityCnt").html(params.cityCnt);
$("#totalCnt").html(params.totalCnt);
$("#inServiceCnt").html(params.inServiceCnt);
$("#cumCustomerCnt").html(params.cumCustomerCntInit);
$("#rtCustomerCnt").html(params.rtCustomerCntInit);
$("#amount").html(params.amount);

// 当日累计客流 
var getCumCustomerCnt = function () {
    var end = getNowIndex();
    if (end == -1) {
        return 0;
    }
    var cnt = data.cumArr.slice(0, end).reduce(function (d, r) { return r + d; }, 0);
    return cnt;
};


// 当日实时客流  
var getRtCustomerCnt = function () {
    var end = getNowIndex();
    if (end == -1) {
        return '-';
    }
    var cnt = data.rtArr[end] + Math.round((Math.random() - 0.5) * 2 * params.inServiceCnt * 5);
    return parseInt(cnt.toFixed(0));
};
// 实现营业额
var getAmount = function () {
    var end = getNowIndex();
    if (end == -1) {
        return 0;
    }
    var cnt = data.amountArr.slice(0, end).reduce(function (d, r) { return r + d; }, 0);
    return cnt.toFixed(0);
};


// 柱图跳动
var changeTop3 = function () {
    // 变化区间 160-190 220-240 320-340
    var getHeightByVal = function (v) {
        var h = -13.8699 * v + 9064.3;
        return Math.round(h);
    }
    var getTextHeight = function (v) {
        var h = -0.92 * v + 630.8238;
        return Math.round(h);
    }

    var cc = roundBetween(160, 190);
    var cd = roundBetween(220, 240);
    var sh = roundBetween(320, 340);

    $('#changchunLabel').html(cc + 'W');
    $("#chengduLabel").html(cd + 'W');
    $("#shanghaiLabel").html(sh + 'W');


    $('#changchunLabel').attr('style', 'text-align:center;font-size: 22px; color:#27C37B; position: absolute; left:1025px; top:' + getTextHeight(cc) + 'px');
    $("#chengduLabel").attr('style', 'text-align:center;font-size: 22px; color:#27BADE; position: absolute; left:1110px;top:' + getTextHeight(cd) + 'px');
    $("#shanghaiLabel").attr('style', 'text-align:center;font-size: 22px; color:#C6327B; position: absolute; left:1190px; top:' + getTextHeight(sh) + 'px');

    var ccPoints = '12856,p 13467,p 13467,8916 12856,8916 ';
    var cdPoints = '13969,p 14579,p 14579,8916 13969,8916 ';
    var shPoints = '15072,p 15683,p 15683,8916 15072,8916 ';

    $('#changchunBar').attr('points', ccPoints.replace('p', getHeightByVal(cc)).replace('p', getHeightByVal(cc)));
    $("#chengduBar").attr('points', cdPoints.replace('p', getHeightByVal(cd)).replace('p', getHeightByVal(cd)));
    $("#shanghaiBar").attr('points', shPoints.replace('p', getHeightByVal(sh)).replace('p', getHeightByVal(sh)));


}


var tmp = 0;  // 用于修复累计客流和实时客流按相同值跳动的bug
setInterval(function () {
    // debugger;
    var cumCustomerCnt = getCumCustomerCnt();
    var rtCustomerCnt = getRtCustomerCnt();
    if (cumCustomerCnt < Math.max(tmp, rtCustomerCnt)) {
        if (tmp < rtCustomerCnt) {
            tmp = rtCustomerCnt;
        }
        else {
            tmp += roundBetween(10, 20);
        }
        cumCustomerCnt = tmp;
    }

    //    $("#cumCustomerCnt").html(toThousands(cumCustomerCnt) == 0 ? '-' : toThousands(cumCustomerCnt / 10000));
    $("#cumCustomerCnt").html((cumCustomerCnt / 10000).toFixed(1));
    //    $("#rtCustomerCnt").html(isNaN(rtCustomerCnt) ? '-' : toThousands(rtCustomerCnt / 10000));
    $("#rtCustomerCnt").html((rtCustomerCnt / 10000).toFixed(1));
    $("#amount").html(toThousands(getAmount()) == 0 ? '-' : toThousands(getAmount()));

    //changeTop3();
}, params.timeStep * 1000);


var dateUtils = {
    getYear() {
        var d = new Date();
        return
    }
}

var secondFlag = true
setInterval(function () {
    var d = moment().format("d")
    var cnd = {
        '0': '星期日', '1': '星期一',
        '2': '星期二', '3': '星期三',
        '4': '星期四', '5': '星期五',
        '6': '星期六'
    }
    $("#year").html(moment().format("YYYY年MM月DD日"))
    $("#weeknum").html(cnd[d])
    $("#hour").html(moment().format("HH")) // HH 24小时制 hh: 12小时制
    $("#minute").html(moment().format("mm"))
}, 1000);

// setInterval(function () {
//     secondFlag = !secondFlag
//     $('#clock-sep').css('color', secondFlag ? 'white' : '#1d1819')
//     // if (secondFlag) {
//     //     $('#clock-sep').hide()
//     // }
//     // else {
//     //     $("#clock-sep").show()
//     // }

// }, 500);




// 缩放屏幕
var resize = function () {
    var width = $(document).width();
    var height = $(document).height();
    width = Math.min(width, height / 16 * 9);
    var fontSize = 16 / 375 * width;
    var fontSize = fontSize.toFixed(0) + 'px';

    $('html').css('font-size', fontSize);
};
resize();
$(window).resize(
    resize);