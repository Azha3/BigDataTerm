package com.icss.exception;
/**
 * 初始化数据异常,如果存在初始化数据时失败，则应该抛出该异常.
 * @author mdx
 *
 */
public class InitDataException extends Exception{

	private static final long serialVersionUID = 1L;
	
	public InitDataException(String msg){
		super(msg);
	}

}
