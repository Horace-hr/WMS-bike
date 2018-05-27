package com.ken.wms;

import java.util.List;
import com.ken.wms.security.util.MD5Util;

public class PwdTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String a="1020123456";
		String password = MD5Util.MD5(a);
		System.out.println(password);
	}

}
