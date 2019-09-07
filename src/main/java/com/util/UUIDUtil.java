package com.util;

import java.util.UUID;
/**
 * 生产唯一标识符
 * @author Wxj
 */
public class UUIDUtil {

	public static String getUUID() {
		String str = UUID.randomUUID().toString();
		str = str.replace("-", "");
		return str;
	}
}
