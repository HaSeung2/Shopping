const productService = (function(){
	function insert(buy,callback){
		$.ajax({
			type:"POST",
			url:"/buy/buyProduct",
			data:JSON.stringify(buy),
			contentType:"application/json; charset=utf-8",
			success:function(result){
				if(callback){
					callback(result);
				}
			},
			error:function(status){
				alert("구매 실패");
			}
		})
	}
	
	return {add:insert};
})();






