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


