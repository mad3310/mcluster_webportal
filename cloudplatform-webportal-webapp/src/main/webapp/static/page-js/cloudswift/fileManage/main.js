/**
 * file list page
 */
define(function(require){
	var pFresh,iFresh;
    var common = require('../../common');
    var cn = new common();
    
    cn.Tooltip();
    
	/*禁用退格键退回网页*/
	window.onload=cn.DisableBackspaceEnter();

    /*加载数据*/
    var dataHandler = require('./dataHandler');
    var fileListHandler = new dataHandler();
    /*
     * 初始化数据
     */
	asyncData();
	
	// $("#search").click(function() {
	// 	cn.currentPage = 1;
	// 	asyncData();
	// });
	// $("#refresh").click(function() {		
	// 	asyncData();
	// });
	// $("#fileName").keydown(function(e){
	// 	if(e.keyCode==13){
	// 		cn.currentPage = 1;
	// 		asyncData();
	// 	}
	// });
	
	/*初始化按钮*/
	// $(".btn-region-display").click(function(){
	// 	$(".btn-region-display").removeClass("btn-success").addClass("btn-default");
	// 	$(this).removeClass("btn-default").addClass("btn-success");
	// 	$("#fileName").val("");
	// 	asyncData();
	// })
	
	/*
	 * 可封装公共方法 begin
	 */
	//初始化分页组件
	// $('#paginator').bootstrapPaginator({
	// 	size:"small",
 //    	alignment:'right',
	// 	bootstrapMajorVersion:3,
	// 	numberOfPages: 5,
	// 	onPageClicked: function(e,originalEvent,type,page){
	// 		cn.currentPage = page;
 //        	asyncData(page);
 //        }
	// });
	//初始化checkbox
	$(document).on('click', 'th input:checkbox' , function(){
		var that = this;
		$(this).closest('table').find('tr > td:first-child input:checkbox')
		.each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
	});
	$(document).on('click', 'tfoot input:checkbox' , function(){
		var that = this;
		$(this).closest('table').find('tr > td:first-child input:checkbox,th input:checkbox ')
		.each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
	});
	/*
	 * 可封装公共方法 end
	 */
	
	//加载列表数据
	function asyncData() {
		var url = "/oss/"+$("#swiftId").val()+"/file/root";
		// var url = "/oss/19/file/root";
		cn.GetData(url,refreshCtl);
		
	}
	function refreshCtl(data) {
		fileListHandler.fileListHandler(data);
	}	
});
