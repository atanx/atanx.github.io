require.config({
    paths : {
        "jquery" : ["http://libs.baidu.com/jquery/2.0.3/jquery"],
        "b" : "b",
        'a':'a'
    }
});


require(["jquery","b"],function($, b){
    $(function(){
        console.log("load finished");
        console.log(b.name);
    })
});
