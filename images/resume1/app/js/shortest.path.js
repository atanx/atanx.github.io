/**
 * 最短路径。
 * */
var range = function(st, end, step, except=[]){
    var list = [];
    for(var i = st; i<=end; i=i+step){
        if(except.indexOf(i)===-1){
            list.push(i);
        }
    }
    return list;
};
var minNoneZero = function(vector, left){
    var min = {index:-1, value:Infinity};
    for(var i = 0; i<left.length; i++){
        var v = vector[left[i]];
        if (v<min.value && v>0){
            min = {index:left[i], value: v};
        }
    }
    return min;
};
var pop = function(vector, left, value){

  for(var i = 0; i<left.length; i++){
      var v = vector[left[i]];
      if (v===value){
          var idx = left.splice(i,1);
          return idx;
      }
  }

};

var dijkstra = function(arr, i, j){
    var vector = [].concat(arr[i]);
    var out = [i];
    var left = range(0, vector.length-1, 1, out);
    while(left.length>0){
        var m = minNoneZero(vector, left);
        var idx = m.index;
        var v = m.value;
        var z = pop(vector, left, v);
        for(var k = 0; k<vector.length; k++){
            var p1 = vector[k];
            var p2 = vector[idx];
            var p3 = arr[idx][k];
            if(k != i && p1 > p2 + p3 ){
                vector[k] = vector[idx] +arr[idx][k];
            }
        }
    }
    console.log('从{i}到{j}的最短路径为：{v}'.replace('{i}', i).replace('{j}', j).replace('{v}', vector[j]));
    return vector;
};

var arr = [
    [0,         5,      6,      9,      7       ],
    [5,         0,      4, Infinity, Infinity   ],
    [6,         4,      0,     3,    Infinity   ],
    [9,   Infinity,     3,     0,       1       ],
    [7,   Infinity, Infinity,  1,       0       ]
];

var a = dijkstra(arr, 0, 3);
var a = dijkstra(arr, 1, 3);
var a = dijkstra(arr, 2, 3); 
var a = dijkstra(arr, 1, 4);
var a = dijkstra(arr, 2, 4);


