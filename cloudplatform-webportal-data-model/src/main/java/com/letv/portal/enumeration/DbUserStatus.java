package com.letv.portal.enumeration;

public enum DbUserStatus implements ByteEnum{
	DEFAULT(0),
	RUNNING(1),  
	BUILDDING(2),
	BUILDFAIL(3),
	AUDITFAIL(4),
	ABNORMAL(5),
	NORMAL(6);
	
	private final Integer value;
	
	private DbUserStatus(Integer value)
	{
		this.value = value;
	}
	
	@Override
	public Integer getValue() {
		return this.value;
	}
}
