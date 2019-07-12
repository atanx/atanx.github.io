
var toThousands = function (value) {
    return (value || 0).toString().replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
};

var roundBetween = function(min, max){
    return Math.round((Math.random()*(max-min) + min));
}