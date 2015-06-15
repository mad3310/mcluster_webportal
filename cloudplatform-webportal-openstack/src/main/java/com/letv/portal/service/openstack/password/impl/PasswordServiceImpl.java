package com.letv.portal.service.openstack.password.impl;

import com.letv.common.util.ConfigUtil;
import com.letv.portal.service.openstack.password.PasswordService;
import org.apache.commons.codec.Charsets;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

@Service("passwordService")
public class PasswordServiceImpl implements PasswordService {

	@Value("${openstack.user.password.salt}")
	private String userPasswordSalt;

	PasswordServiceImpl(){
		ConfigUtil.class.getName();
	}

	@SuppressWarnings("deprecation")
	public String userIdToPassword(String userId)
			throws NoSuchAlgorithmException {
		return DigestUtils.sha512Hex((userId + userPasswordSalt)
				.getBytes(Charsets.UTF_8));
	}

	public static void main(String[] args) throws NoSuchAlgorithmException {
		PasswordServiceImpl i=new PasswordServiceImpl();
		i.userPasswordSalt="abcdefg12345";
		Scanner scanner=new Scanner(System.in);
		String line=scanner.nextLine();
		String pw=i.userIdToPassword(line);
		System.out.println(pw);
	}
}
