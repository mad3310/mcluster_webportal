package com.letv.portal.model;


/**Program Name: DbUserModel <br>
 * Description:  <br>
 * @author name: liuhao1 <br>
 * Written Date: 2014年8月12日 <br>
 * Modified By: <br>
 * Modified Date: <br>
 */
public class DbUserModel extends BaseModel {
	
	
	
	private static final long serialVersionUID = 549601154139114218L;
	
	private String id;   //主键ID
	private String dbId; //所属db
	private String username; //用户名
	private String password; //密码
	private String salt; //加密盐

	private String type; //用户类型   1管理员 2读用户3 读写用户
	
	private String acceptIp;         //用户访问IP(192.178.2.1或192.168.3.%)
	private String maxConcurrency;   //最大并发量(100/s)
	private String readWriterRate;   // 读写比例(1:2)
	
	private String maxQueriesPerHour;   //每小时最大查询数(用户可填,系统自动填充,管理员审核修改)
	private String maxUpdatesPerHour;   //每小时最大更新数(用户可填,系统自动填充,管理员审核修改)
	private String maxConnectionsPerHour;   //每小时最大连接数(用户可填,系统自动填充,管理员审核修改)
	private String maxUserConnections;   //用户最大链接数(用户可填,系统自动填充,管理员审核修改)
	
	private String status; 
	
	private String isDeleted; //是否删除   0:无效 1:有效
	private String createTime;
	private String createUser;
	private String updateTime;
	private String updateUser;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDbId() {
		return dbId;
	}
	public void setDbId(String dbId) {
		this.dbId = dbId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	
	public String getAcceptIp() {
		return acceptIp;
	}
	public void setAcceptIp(String acceptIp) {
		this.acceptIp = acceptIp;
	}
	public String getMaxConcurrency() {
		return maxConcurrency;
	}
	public void setMaxConcurrency(String maxConcurrency) {
		this.maxConcurrency = maxConcurrency;
	}
	public String getReadWriterRate() {
		return readWriterRate;
	}
	public void setReadWriterRate(String readWriterRate) {
		this.readWriterRate = readWriterRate;
	}
	public String getMaxQueriesPerHour() {
		return maxQueriesPerHour;
	}
	public void setMaxQueriesPerHour(String maxQueriesPerHour) {
		this.maxQueriesPerHour = maxQueriesPerHour;
	}
	public String getMaxUpdatesPerHour() {
		return maxUpdatesPerHour;
	}
	public void setMaxUpdatesPerHour(String maxUpdatesPerHour) {
		this.maxUpdatesPerHour = maxUpdatesPerHour;
	}
	public String getMaxConnectionsPerHour() {
		return maxConnectionsPerHour;
	}
	public void setMaxConnectionsPerHour(String maxConnectionsPerHour) {
		this.maxConnectionsPerHour = maxConnectionsPerHour;
	}
	public String getMaxUserConnections() {
		return maxUserConnections;
	}
	public void setMaxUserConnections(String maxUserConnections) {
		this.maxUserConnections = maxUserConnections;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "DbUserModel [id=" + id + ", dbId=" + dbId + ", username="
				+ username + ", password=" + password + ", salt=" + salt
				+ ", type=" + type + ", acceptIp=" + acceptIp
				+ ", maxConcurrency=" + maxConcurrency + ", readWriterRate="
				+ readWriterRate + ", maxQueriesPerHour=" + maxQueriesPerHour
				+ ", maxUpdatesPerHour=" + maxUpdatesPerHour
				+ ", maxConnectionsPerHour=" + maxConnectionsPerHour
				+ ", maxUserConnections=" + maxUserConnections + ", status="
				+ status + ", isDeleted=" + isDeleted + ", createTime="
				+ createTime + ", createUser=" + createUser + ", updateTime="
				+ updateTime + ", updateUser=" + updateUser + "]";
	}
	
}
