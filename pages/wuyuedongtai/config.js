﻿var params = {
    plazaCnt: "50余城70余座",   //广场数
    cityCnt: 98,
    totalCnt: 121, // 在业项目数
    inServiceCnt: 62, // 已开业吾悦广场 modified at: 2019.12.26
    cumCustomerCntInit: '-', //累计数起始值
    rtCustomerCntInit: '-', // 实时数起始值
    amount: '-', //消费金额起始值
    inServiceTime: [9, 22], // 营业时间10点到22点 
    cumSpeedPerPlaza: {
        weekend: 2432865 / 42,  // 周末单个项目累计客流数 10万
        workday: 1697858 / 42  // 工作日单个项目累计客流数
    },
    rtSpeedPerPlaza: {
        weekend: { min: 100 * 1.6, max: 244081 / 42 }, // 工作日单个项目累计客流数
        workday: { min: 100, max: 161806 / 42 } // 工作日单个项目累计客流数
    },
    amountPerPlaza: {
        workday: 2760 / 23, // 工作日单个项目消费金额，单位：万元 2760w
        weekend: 5760 / 23 // 周末单个项目消费金额，单位：万元 5750w
    },
    speedLine: [
        3, // 9
        5.9,  // 10
        6.7,  // 11
        9.1,  // 12
        12.9,  // 13
        10.1,  // 14
        8.1, // 15
        7.7, // 16
        9.2, // 17
        10.9, // 18
        14.1, // 19
        12,  // 20
        8, // 21 
    ], // 速度曲线
    // speedLine: [
    //     2, // 9
    //     3.9,  // 10
    //     5.7,  // 11
    //     7.4,  // 12
    //     8.9,  // 13
    //     10.1,  // 14
    //     11.1, // 15
    //     11.7, // 16
    //     12, // 17
    //     12.9, // 18
    //     9, // 19
    //     4,  // 20
    //     3, // 21 
    // ], // 速度曲线
    timeStep: 1 //秒，跳动时间间隔
};
