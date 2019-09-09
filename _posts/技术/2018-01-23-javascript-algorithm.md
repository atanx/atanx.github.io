---
layout: post
title: javascript-数据结构与算法实现
description: javascript-数据结构与算法实现
category: 技术
---
[toc]


# 数据结构
## 队列
```js
var Queue = function(){
    this._data = [];
}

Queue.prototype.is_empty = function(){
    return this._data.length == 0;
}

Queue.prototype.enqueue = function(d){
    return this._data.push(d);
}

Queue.prototype.dequeue = function(){
    if(this.is_empty()){
        throw 'queue is empty!';
    }
    else{
        d = this._data.splice(0,1);
    }
    return d[0];
}

Queue.prototype.size = function(){
    return this._data.length;
}

var queue = new Queue();
for(var i = 0; i<10; i++){
    queue.enqueue(i);
}

while(!queue.is_empty()){
    console.log(queue.dequeue());
}
```

## 栈
```js

var Stack = function(){
    this._data = [];
}

Stack.prototype.is_empty = function(){
    return this._data.length==0;
}

Stack.prototype.push = function(d){
    this._data.push(d);
}

Stack.prototype.pop = function(){
    if(this.is_empty()){
        throw "stack is empty!"
    }
    return this._data.pop();

}

Stack.prototype.peek = function(){ 
    return this._data[this._data.length]; 
}

Stack.prototype.size = function(){
    return this._data.length;
}


// 监测括号是否平衡
var check_brace = function(str){
    var opens = '([{';
    var closes = ')]}';

    var stack = new Stack();
    var blanced = true;

    for(var i = 0; i<str.length; i++){
        var s = str[i];
        if(opens.indexOf(s)>=0){ 
            stack.push(str[i]);
        }
        if(closes.indexOf(s)>=0){
            if(stack.is_empty()){
                blanced = false;
                break;
            }
            else{
                j = stack.pop();
                if (opens.indexOf(j) != closes.indexOf(s)){
                    blanced = false;
                    break;
                }
                                
            }
        }

     }
     if(!stack.is_empty()){
         blanced = false;
     }
    return blanced;
}


// 十进制转二进制
var dec2bin= function(dec){
    var stack = new Stack();
    var c = dec;
    while(c>0){
        var a = c % 2;
        c = Math.floor(c / 2);
        stack.push(a);
    }
    binstr = '';
    while(!stack.is_empty()){
        binstr += stack.pop();
    }
    return binstr;
}


// 后缀表达式
var infix2postfix = function(infix){ 
    var a={};
    a['*']=3;
    a['/']=3;
    a['+']=2;
    a['-']=2;
    a['(']=1;
    var stack=new Stack();
    post='';

    for(var i = 0; i<infix.length; i++){ //对于每一个字符
        var s = infix[i];
       
        if (!a.hasOwnProperty(s) &&  s!=')'){ //非运算符
            post+=s;
        }
        else if(s=='('){  // 左括号
            stack.push(s);
        }
        else if (s==')'){ // 右括号 
            t=stack.pop(); 
            console.log(stack);
            console.log(t);
            while (t!='('){ 
                post+= ' ' + t;
                t=stack.pop(); 
            }
        }
        else{  // * / + - 
            while (!stack.is_empty() && a[s]<=a[stack.peek()]){ 
                post+=stack.pop();
            }  
            stack.push(s);
            post += ' ';
        }  
        console.log(s,stack._data) ;     
    }

    while (!stack.is_empty()){
        post+= ' ' + stack.pop();
    }

    return post;
}

// 后缀表达式计算
var postfixExp = function(postfix){
    var stack = new Stack();
    var post_list = postfix.split(' ');
    for(var i = 0; i<post_list.length; i++){
        var s  =post_list[i];
        if('+-*/'.indexOf(s) == -1){ 
            stack.push(s);
        }
        else{
            var a = stack.pop();
            var b = stack.pop();
            var result = math(s, b, a); 
            stack.push(result);
        }
    }
    return stack.pop();
}

var math = function(op, b, a){
    if(op=='+'){
        return parseFloat(b) + parseFloat(a);
    }
    if(op=='-'){
        return  parseFloat(b) - parseFloat(a);
    } 
    if(op=='*'){
        return parseFloat(b) * parseFloat(a);
    }
    if(op=='/'){
        return  parseFloat(b) / parseFloat(a);
    }
}

var p = infix2postfix('(12+2)/(10-3.6)');
postfixExp(p);

```

## 链表
```js
var Node = function(element){
    this.element = element;
    this.next = null;
}

var LinkedList = function(){
    this.head = new Node('head'); 
}

LinkedList.prototype.find = function(item){
    var currNode = this.head;
    while(currNode.element != item){
        currNode = currNode.next;
    }
    return currNode;
}

LinkedList.prototype.insert = function(newElement, item){
    var newNode = new Node(newElement);
    var current = this.find(item);
    newNode.next = current.next;
    current.next = newNode;
}
LinkedList.prototype.display = function(){
    var s = '';
    var currNode = this.head;
    while(currNode.next != null){
        s += " "+currNode.element;
        
    }
    
    return s;
}

var cities = new LinkedList();
cities.insert('北京', 'head');
cities.insert('上海', '北京');

cities.insert('济南', '北京');
var arr = cities.display();
console.log(arr);
```

## 树
```js

/** 树形结构节点 */
var Node = function(element){
    this.element = element;
    this._parent = null;
    this._children = [];
}
Node.prototype.is_leaf = function(){
    return this._children.length == 0;
}
Node.prototype.is_root = function(){
    return this._parent == null;
}
Node.prototype.deepth = function(){

}

/** 树状结构 */
var Tree = function(){
    this.nodes = [];
    this.root = null; 
}

Tree.prototype.add_root = function(node){
    this.root = node;
    this.nodes.push(node);
    return this.root;
}
Tree.prototype.append_child = function(parent_node, child_node){
    parent_node._children.push(child_node);
    child_node._parent = parent_node;
    this.nodes.push(child_node);
    return {parent: parent_node, child: child_node};
}
Tree.prototype.display = function(){
    var display = function(node, deepth){
        var s = '';
        for(var i = 0; i<deepth; i++){ 
            s = '\t'+ s; 
        }
        s =  s + node.element;
        console.log(s);
        for (var i = 0; i<node._children.length; i++){
            display(node._children[i], deepth+1);
        }

    }
    display(this.root, 0);
}

Tree.prototype.deepth = function(){
    var deepth = 0;
    for(var i = 0; i<this.nodes.length; i++){
            var node = this.nodes[i];

            if(!node.is_leaf()){
                continue;
            }

            var tmp_deepth = 1;
            var p = node._parent;
            while(p!=null){
                tmp_deepth += 1;
                p = p._parent;
            }
            if(tmp_deepth>deepth){
                deepth = tmp_deepth;
            }

      }

    return deepth;
}


var tree = new Tree();
var root = tree.add_root(new Node('A'));
r = tree.append_child(root, new Node('B'));
rc = tree.append_child(root, new Node('C'));
r = tree.append_child(rc.child, new Node('E'));
r = tree.append_child(rc.child, new Node('F'));
r = tree.append_child(root, new Node('D'));

tree.display();
```


## 图
```js
/***********************************************************************************
 * Javascript实现dijkstra最短路径算法。
 * 作者：江斌
 ***********************************************************************************/

/*** 图数据结构。
 * @graph: Graph类型
 * @src_node_name: string 起始节点名称
 * @dist_node_name: string 目标节点名称
 */
var Graph = function () {
    this.nodes = {};
    this.edges = {};
    this.distances = {};

    this.add_node = function (node) {
        this.nodes[node.name] = node;
    };
    this._add_edge = function (from_node_name, to_node_name, distance) {
        if (this.edges[from_node_name] == undefined) {
            this.edges[from_node_name] = []
        }
        this.edges[from_node_name].push(to_node_name);
        this.distances[from_node_name + '_' + to_node_name] = distance;
    };
    this.add_edge = function (from_node_name, to_node_name, distance, bipartite = true) {

        this._add_edge(from_node_name, to_node_name, distance);
        if (bipartite) {
            this._add_edge(to_node_name, from_node_name, distance);
        }
    };
};

/**
 * 图节点
 * @param name string 节点名称。
 */
var Node = function (name) {
    this.distance = Infinity;
    this.predecessor = null;
    this.name = name;

    // this.set_distance = function(distance){
    //     this.distance = distance;
    // };
    //
    // this.get_distance = function(){
    //     return this.distance;
    // };
    //
    // this.set_predecessor = function(node){
    //     this.predecessor = node;
    // };
    //
    // this.get_predecessor = function(){
    //     return this.predecessor;
    // }
};

var dijkstra = function (graph, src_node_name, dist_node_name) {
    graph.nodes[src_node_name].distance = 0;
    var permanent = new Set();
    var temp = new Set();
    temp.add(src_node_name);
    while (temp.size > 0) {
        var min_node_name = null;
        temp.forEach(function (d) {
            if (min_node_name == null) {
                min_node_name = d;
            }
            else if (graph.nodes[d].distance < graph.nodes[min_node_name].distance) {
                min_node_name = d;
            }
        });

        temp.delete(min_node_name);
        permanent.add(min_node_name);

        var current_distance = graph.nodes[min_node_name].distance;
        for (var i = 0; i < graph.edges[min_node_name].length; i++) {
            var neighbour = graph.edges[min_node_name][i];
            var new_distance = current_distance + graph.distances[min_node_name + '_' + neighbour];
            if (!permanent.has(neighbour) && new_distance < graph.nodes[neighbour].distance) {
                graph.nodes[neighbour].distance = new_distance;
                graph.nodes[neighbour].predecessor = min_node_name;
                temp.add(neighbour); //
            }
        }

    }
    print_path(graph, dist_node_name);
};

function print_path(graph, dist) {
    var current = dist;
    var path = [dist];
    while (graph.nodes[current].predecessor != null) {
        path.push(graph.nodes[current].predecessor);
        current = graph.nodes[current].predecessor;
    }
    console.log(path.reverse().join('->'));
}

function run() {
    var g = new Graph();

    g.add_node(new Node('A'));
    g.add_node(new Node('B'));
    g.add_node(new Node('C'));
    g.add_node(new Node('D'));
    g.add_node(new Node('E'));
    g.add_node(new Node('F'));

    g.add_edge('A', 'B', 10);
    g.add_edge('A', 'C', 15);
    g.add_edge('A', 'E', 30);
    g.add_edge('B', 'D', 50);
    g.add_edge('B', 'E', 14);
    g.add_edge('C', 'D', 12);
    g.add_edge('C', 'E', 12);
    g.add_edge('D', 'F', 10);
    g.add_edge('E', 'F', 20);


    dijkstra(g, 'A', 'F');
}

run();
```

# 算法
## 排序
### 冒泡排序
### 选择排序
```js
var select_sort = function(arr){
    for(var i = 0; i< arr.length; i++){
        var index = i;
        for(var j=i+1; j<arr.length; j++ ){
            if(arr[j]<arr[index]){
                index = j;
            }
        }

        if(index == i){
            continue;
        }
        else{
            var tmp = arr[i];
            arr[i] = arr[index];
            arr[index] = tmp;
        }
    }
    return arr;
}
```
### 插入排序


### 快速排序
```javascript
var quick_sort = function(arr, start, end){
   if(start>=end){
       return;
   }
    var low_idx  = start;
    var high_idx = end;
    var base = arr[start];
    while(low_idx < high_idx){
        while(low_idx<high_idx && arr[high_idx]>=base){
            high_idx--;
        }
        if(low_idx < high_idx){
            arr[low_idx] = arr[high_idx];
            low_idx++;
        }

        while(low_idx<high_idx && arr[low_idx] < base){
            low_idx++;
        }
        if(low_idx < high_idx){
            arr[high_idx] = arr[low_idx];
            high_idx--;
        }
    } 
    arr[low_idx] = base;
    console.log(low_idx, high_idx,'base='+base, arr);
    quick_sort(arr, start, low_idx-1);
    quick_sort(arr, low_idx+1, end);
}
```
### 堆排序
```js

/*************************************************
*
* 打印堆
*
*************************************************/

function mi2(num){
    var m = 0;
    while(num>Math.pow(2,m)){
        m = m + 1;
    }
    return m;
}
function print_heap(heap_arr){
    var idx_arr = [];
    for(var i = 0; i< heap_arr.length; i++){
        idx_arr.push([i]); 
    }
    for(var i = Math.floor(idx_arr.length/2); i>=0; i--){
        var left = 2*i+1;
        var right = 2*i+2;
        if(left<idx_arr.length){
            idx_arr[i] = idx_arr[left].concat(idx_arr[i]);
            idx_arr[left]= null;
        }
        if(right<idx_arr.length){
            idx_arr[i] = idx_arr[i].concat(idx_arr[right]);
            idx_arr[right]= null;
        }
    }
    idx_arr =  idx_arr[0]; 

    
    var tmp_arr = [];  
    var height = mi2(heap_arr.length);
    var s = '';
    for(var level = 0; level<height; level++){
        var tmp_arr = [];
        for(var j=0; j<heap_arr.length; j++){
            tmp_arr.push('   ');
        }

        var start = Math.pow(2, level) - 1;
        var end = Math.pow(2, level+1) -2;
        for(var i = start; i<=end; i++){
            var pos = idx_arr.indexOf(i);
            tmp_arr[pos] = heap_arr[i];
        }

        s += tmp_arr.join(' ')+'\n';
       }
       console.log(s);
};
 


function HeapAdjust(arr,s,length){                // 使用调整大顶堆进行排序，将s到m之间的数值调整为大顶堆！
           var max_idx = s;                  // 将大顶堆顶值赋值给max；
           var left = 2*s+1;
           var right = 2*s+2;
           if(left < length && arr[left]>arr[max_idx]){
               max_idx = left;
           }
           if(right < length && arr[right]>arr[max_idx]){
               max_idx = right;
           }
           if(max_idx!=s){ 
              swap(arr, s, max_idx);  
              HeapAdjust(arr,max_idx,length);
              
           }
           else{ 
              return;
           }
        }

function HeapSort(arr)
{
    print_heap(arr);
   for(var i=Math.floor(arr.length/2); i>=0; i--){//首先构造一个标准的大堆顶，只需要便利二叉树一半的节点，就能够把大堆顶构造出来 
       HeapAdjust(arr, i, arr.length);
   }

   for(var i=arr.length-1; i>0; i--){//构造完之后 把堆顶的值和最后一个互换，然后 排除最后一个继续进行打造大堆顶！
       swap(arr, 0, i);  
       HeapAdjust(arr, 0, i); 
      console.log( 'i='+i);
      print_heap(arr);
   }
}
function swap(arr, i, j){
   var temp = arr[i];
   arr[i] = arr[j];
   arr[j] = temp;
}

var random = function(n){
    var a = [];
    while(n>0){
        a.push(Math.round(Math.random()*100));
        n--;
    }
    return a;
}
//arr = [5,3,7,9,2,6,8];
// arr = random(10);
arr = [51, 94, 64, 10, 27, 29, 88, 21, 16, 98];
HeapSort(arr); 
```

非递归实现
```js
 
function mi2(num){
    var m = 0;
    while(num>Math.pow(2,m)){
        m = m + 1;
    }
    return m;
}
function print_heap(heap_arr){
    var idx_arr = [];
    for(var i = 0; i< heap_arr.length; i++){
        idx_arr.push([i]); 
    }
    for(var i = Math.floor(idx_arr.length/2); i>=0; i--){
        var left = 2*i+1;
        var right = 2*i+2;
        if(left<idx_arr.length){
            idx_arr[i] = idx_arr[left].concat(idx_arr[i]);
            idx_arr[left]= null;
        }
        if(right<idx_arr.length){
            idx_arr[i] = idx_arr[i].concat(idx_arr[right]);
            idx_arr[right]= null;
        }
    }
    idx_arr =  idx_arr[0]; 

    
    var tmp_arr = [];  
    var height = mi2(heap_arr.length);
    var s = '';
    for(var level = 0; level<height; level++){
        var tmp_arr = [];
        for(var j=0; j<heap_arr.length; j++){
            tmp_arr.push('   ');
        }

        var start = Math.pow(2, level) - 1;
        var end = Math.pow(2, level+1) -2;
        for(var i = start; i<=end; i++){
            var pos = idx_arr.indexOf(i);
            tmp_arr[pos] = heap_arr[i];
        }

        s += tmp_arr.join(' ')+'\n';
       }
       console.log(s);
};


/***
* l：数组
* s: 堆顶在数组中的下标
* m：堆的长度
*/
function HeapAdjust(l,s,m){//使用调整大顶堆进行排序，将s到m之间的数值调整为大顶堆！
   var temp=l[s];//将大顶堆顶值负值给temp； 
   for(var j=2*s+1;j<m;j=2*j+1) 
   {
       //if(j<m&&l[j]<l[j+1]) // j修改为j+1
       if(j+1<m&&l[j]<l[j+1])
           ++j;
       if(temp>=l[j])//如果堆顶的值大于当前j下标的值，就不用再找了。跳出循环
         break;
       l[s]=l[j];//小于j下标的值，就把l[j]复制给l[s]
       s=j;//s就指向当前j的位置，为下步把顶值赋值到这个位置做准备（循环完之前，先不赋值）
       }
      l[s]=temp;//最后赋值给l[s]（s指向现在找到的最大的大堆顶的值）
   }
function HeapSort(l)
{
   //for(var i=l.length/2;i>=0;i--) // 增加取整
   for(var i=Math.floor(l.length/2);i>=0;i--) 
       HeapAdjust(l,i,l.length);  
   for(var i=l.length;i>0;i--){//构造完之后 把堆顶的值和最后一个互换，然后 排除最后一个继续进行打造大堆顶！ 
       swap(l,0,i-1);
       print_heap(l);
       //HeapAdjust(l,0,i-2);  // i-2修改为i-1
       HeapAdjust(l,0,i-1); 
   }
}
function swap(l,i,j){
   var temp=l[i];
   l[i]=l[j];
   l[j]=temp;
}

//arr = [51, 94, 64, 10, 27, 29, 88, 21, 16, 98];
arr = [94, 64, 10, 27, 29, 88, 21, 16, 98];
HeapSort(arr);
```
### 希尔排序
### 归并排序

## 查找


