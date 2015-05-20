<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
</script>

<div id="sidebar" class="sidebar responsive" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
	<ul id="sidebar-list" class="nav nav-list">
		<li id="sidebar-dashboard" >
			<a href="${ctx}/dashboard">
				<i class="menu-icon fa fa-tachometer"></i> 
				<span class="menu-text">Dashboard</span> 
			</a>
		</li>
		<li id="sidebar-cluster-mgr" >
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-cubes"></i> 
				<span class="menu-text"> 集群管理 </span> 
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="submenu">
				<li id="sidebar-hcluster-list" >
					<a href="${ctx}/list/hcluster"> 
						<i class="menu-icon fa fa-caret-right"></i>
						物理机集群列表
					</a>
					<b class="arrow"></b>
				</li>
				<li id="sidebar-mcluster-list" >
					<a href="${ctx}/list/mcluster"> 
						<i class="menu-icon fa fa-caret-right"></i>
						Container集群列表
					</a>
					<b class="arrow"></b>
				</li>
				<li id="sidebar-container-list" >
					<a href="${ctx}/list/container"> 
						<i class="menu-icon fa fa-caret-right"></i>
						Container列表
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>
		<li id="sidebar-db-mgr" >
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-database"></i> 
				<span class="menu-text"> 数据库管理 </span> 
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="submenu">
				<li id="sidebar-db-list" >
					<a href="${ctx}/list/db"> 
						<i class="menu-icon fa fa-caret-right"></i>
						数据库列表
					</a>
					<b class="arrow"></b>
				</li>
				<li id="sidebar-db-list" >
					<a href="${ctx}/list/dbUser"> 
						<i class="menu-icon fa fa-caret-right"></i>
						数据库用户列表
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>
		<li id="sidebar-forewarning-monitor-mgr" >
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-list"></i> 
				<span class="menu-text"> 预警管理 </span> 
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="submenu">
				<li id="sidebar-monitor-list" >
					<a href="${ctx}/list/mcluster/monitor/1"> 
						<i class="menu-icon fa fa-caret-right"></i>
						cluster监控列表
					</a>
					<b class="arrow"></b>
				</li>
				<li id="sidebar-monitor-list" >
					<a href="${ctx}/list/mcluster/monitor/2"> 
						<i class="menu-icon fa fa-caret-right"></i>
						node监控列表
					</a>
					<b class="arrow"></b>
				</li>
				<li id="sidebar-monitor-list" >
					<a href="${ctx}/list/mcluster/monitor/3"> 
						<i class="menu-icon fa fa-caret-right"></i>
						db监控列表
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>
		<li id="sidebar-monitor-mgr" >
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-bar-chart-o"></i> 
				<span class="menu-text"> 监控管理 </span> 
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="submenu">
				<li id="sidebar-monitor-view" >
					<a href="${ctx}/view/mcluster/monitor"> 
						<i class="menu-icon fa fa-caret-right"></i>
						container集群监控视图
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>
		<li id="backupRecover" >
			<a href="${ctx}/list/backup">
				<i class="menu-icon fa  fa-university"></i> 
				<span class="menu-text">备份与恢复</span> 
			</a>
		</li>
		<li id="sidebar-timing-task-mgr" >
			<a href="${ctx}/list/timingTask">
				<i class="menu-icon fa  fa-clock-o"></i> 
				<span class="menu-text">定时任务管理</span> 
			</a>
		</li>
		<li id="sidebar-task-mgr" >
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-tasks"></i> 
				<span class="menu-text">任务管理</span> 
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="submenu">
				<li id="sidebar-task-unit-view" >
					<a href="${ctx}/list/job/unit"> 
						<i class="menu-icon fa fa-caret-right"></i>
						任务单元列表
					</a>
					<b class="arrow"></b>
				</li>
				<li id="sidebar-task-stream-view" >
					<a href="${ctx}/list/job/stream"> 
						<i class="menu-icon fa fa-caret-right"></i>
						任务流列表
					</a>
					<b class="arrow"></b>
				</li>
				<li id="sidebar-task-stream-view" >
					<a href="${ctx}/list/job/monitor"> 
						<i class="menu-icon fa fa-caret-right"></i>
						任务监控
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>
		<li id="sidebar-image-mgr" >
			<a href="${ctx}/list/gce/image">
				<i class="menu-icon fa  fa-download"></i> 
				<span class="menu-text">镜像管理</span> 
			</a>
		</li>
		<li id="sidebar-zk-mgr" >
			<a href="${ctx}/list/zk">
				<i class="menu-icon fa  fa-cog"></i> 
				<span class="menu-text">zookeeper管理</span> 
			</a>
		</li>
	</ul>

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
	
	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
		if(!IsPC()){
		//判断是否支持触摸事件
			function isTouchDevice() {
				try {
					document.createEvent("TouchEvent");
					bindEvent(); //绑定事件
					initMobileSider();
				} catch (e) {
				}
			}
			//全局变量，触摸开始位置
			var startX = 0, startY = 0;
			//touchstart事件
			function touchSatrtFunc(evt) {
				try {
					//evt.preventDefault(); //阻止触摸时浏览器的缩放、滚动条滚动等
					var touch = evt.touches[0]; //获取第一个触点
					var x = Number(touch.pageX); //页面触点X坐标
					var y = Number(touch.pageY); //页面触点Y坐标
					//记录触点初始位置
					startX = x;
					startY = y;
				} catch (e) {
				}
			}
			//touchmove事件，这个事件无法获取坐标
			function touchMoveFunc(evt) {
				try {
					//evt.preventDefault(); //阻止触摸时浏览器的缩放、滚动条滚动等
					var touch = evt.touches[0]; //获取第一个触点
					var x = Number(touch.pageX); //页面触点X坐标
					var y = Number(touch.pageY); //页面触点Y坐标
					//判断滑动方向
					if (x - startX > 100) {
						  $("#menu-toggler").addClass("display");
						  $("#sidebar").addClass("display");
					}else if(x - startX < -100){
						$("#menu-toggler").removeClass("display");
						  $("#sidebar").removeClass("display");
					}
				} catch (e) {
				}
			}
			//touchend事件
			function touchEndFunc(evt) {
				try {
				} catch (e) {
				}
			}
			//绑定事件
			function bindEvent() {
				document.addEventListener('touchstart', touchSatrtFunc, false);
				document.addEventListener('touchmove', touchMoveFunc, false);
                document.addEventListener('touchend', touchEndFunc, false);
			}
			isTouchDevice() ;
		}
	</script>
</div>
