/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

package encryption;

import java.util.Scanner;

public class JniKeyEncrypt {
	public native String generateKeyEncryptKey(String encrypt_key);

	public native String generateEncryptKey(String encrypt_key, String kek);
	
	public native String regenerateEncryptKey(String eck, String oldKey, String kek);
	
	static {
		System.load("/usr/lib64/jimant/jni/libJniKeyEncrypt.so");
	}
	
	public static void main(String[] args) {
		
		JniKeyEncrypt encrypt = new JniKeyEncrypt();

		String data = "";
		int count = 0;

        Scanner scan = new Scanner(System.in);                                                                       
        System.out.println("data input: ");       
        data = scan.nextLine();        	
		System.out.println("repeat count input: ");       
        count = scan.nextInt(); 

		System.out.println("data: " + data);

		String kek = "";
		String remakeKek =  "";
		String eck =  "";
		String remakeEck =  "";

		for(int i=0; i<count; i++){
			kek = encrypt.generateKeyEncryptKey(data);
			remakeKek = encrypt.generateKeyEncryptKey(data);
			eck = encrypt.generateEncryptKey(data, kek);
			remakeEck = encrypt.regenerateEncryptKey(eck, kek, remakeKek);
			
			System.out.println("kek: " + kek);
			System.out.println("remakeKek: " + remakeKek);
			System.out.println("eck: " + eck);
			System.out.println("remakeEck: " + remakeEck);

			System.out.println();
		}
		
	}
}
