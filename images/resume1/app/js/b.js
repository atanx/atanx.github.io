define(['jquery', 'a'], function($){
    function fun1(){
        console.log("it works[b]");
    }

    fun1();
    console.log($);

    return {
        name: 'module b'
    };
});
