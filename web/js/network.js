function network(url,requestdata) {
    return new Promise(function(resolve, reject) {
        // 异步处理
        // 处理结束后、调用resolve 或 reject
        $.post(url,requestdata,function(data){
            //使用dom技术动态的产生 二级商品种类下拉列表框
            resolve(data);
        },"json");
    });
}