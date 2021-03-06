<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh">
<%@include file='main.jsp' %>
<style>
	table input{margin-top:0;}
</style>
<body>
<%@ include file="../../layouts/header.jsp"%>
<!-- main-content begin-->
<div class="container-fluid">
	<div class="row main-header overHidden"> <!-- main-content-header begin -->
		<div class="col-xs-12 col-sm-12 col-md-6">
			<div class="pull-left">
				<h5>
				<span>缓存实例列表</span>
				<button class="btn btn-success btn-md btn-region-display hidden-xs">全部</button>
				<button class="btn btn-default btn-md btn-region-display hidden-xs">北京</button>
				<button class="btn btn-success btn-sm btn-region-display hidden-sm hidden-md hidden-lg">全部</button>
				<button class="btn btn-default btn-sm btn-region-display hidden-sm hidden-md hidden-lg">北京</button>
				</h5> 
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 hidden-xs">
			<div class="pull-right">
				<h5 class="bdl-0">
				<button class="btn-default btn btn-md" id="refresh"><span class="glyphicon glyphicon-refresh"></span>刷新</button>
				<button class="btn-primary btn btn-md" onclick="window.open('${ctx}/detail/cacheCreate')">购买缓存实例</button>
				<!-- <button class="btn-warning btn btn-md disabled" onclick="">删除缓存实例</button> -->
				</h5>
			</div>
		</div>
		<div>
			<div class="pull-left">
				<form class="form-inline" role="form">
					<div class="form-group col-xs-9 col-sm-10">
						<input onkeyup="value=value.replace(/[\W]/g,'') " 
						onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
						id="cacheName" type="text" class="form-control" size="48" placeholder="请输入缓存实例名称进行搜索">
					</div>
					<div class="col-xs-3 col-sm-2">
						<button id="search" type="button" class="btn btn-default"><span class="hidden-xs">搜索</span><span class="glyphicon glyphicon-search hidden-sm hidden-md hidden-lg"></span></button>
					</div>
				</form>
			</div>
		</div>
	</div><!-- main-content-header end-->

	<div class="row"><!-- main-content-center-begin -->
		<div class="col-sm-12 col-md-12">
			<table class="table table-hover table-se">
				<thead>
					<tr>
						<th width="10">
							<input type="checkbox">
						</th>
						<th class="padding-left-32">实例名称</th>
						<th>运行状态</th>
						<th class="hidden-xs">实例类型</th>
						<th class="hidden-xs">实例大小</th>
						<th class="hidden-xs">地域</th>
						<th class="hidden-xs">可用区</th>
						<th class="hidden-xs">所在服务集群</th>
						<th class="hidden-xs">创建时间</th>
						<th class="hidden-xs">付费类型</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="tby">
				</tbody>
				<tfoot id="paginatorBlock">
					<tr class="tfoot">
						<td width="10">
							<input type="checkbox">
						</td>
						<td colspan="10">
						<div class="col-xs-4 col-sm-6" style="margin:2px 0;padding:0;">
							<div class="pull-left">
									<div>
										<div class="pull-left">
											<button class="btn btn-default hidden-xs" disabled="disabled" style="height:30px;font-size:12px;">批量续费</button>
											<button class="btn btn-default btn-sm hidden-sm hidden-md hidden-lg" disabled="disabled"><span class="glyphicon glyphicon-shopping-cart"></span> 续费</button>
										</div>
									</div>
							</div>
						</div>
						<div class="col-xs-8 col-sm-6" style="margin:2px 0;padding:0;">
							<div class="pull-right">
								<div class="pagination-info hidden-xs">
									<span class="ng-binding">共有<span id="totalRecords">1</span>条</span>， 
									<span class="ng-binding">每页显示：<span id="recordsPerPage">10</span>条</span>&nbsp;
								</div>
								<ul id="paginator" class="pagination pagination-sm"></ul>
							</div>
						</div>
						</td>
					</tr>
				</tfoot>
			</table>
		    
		</div>
	</div><!-- main-content-center-end -->
</div>
</body>
<script type="text/javascript" src="${ctx}/static/modules/seajs/2.3.0/sea.js"></script>
<script>
	//Set configuration
seajs.config({
	base: "${ctx}/static/modules/",
	alias: {
		"jquery": "jquery/2.0.3/jquery.min.js",
		"bootstrap": "bootstrap/bootstrap/3.3.0/bootstrap.js",
		"paginator": "bootstrap/paginator/bootstrap-paginator.js"
	}
});
seajs.use("${ctx}/static/page-js/cloudcache/cacheList/main");
/*self define*/
</script>
</html>