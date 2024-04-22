package com.waterwastage.utils;
import java.io.File;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Basemethods {

	
	
	
	public static String getUser(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = user.getUsername();
		return userName;
	} 
	
	@SuppressWarnings("deprecation")
	public static String uploadIntoS3(String fileName,String filePath){
	
		String link = "";

		final String file = filePath + fileName  ;
		final String keyId = "wwp/" + fileName;
		
		final String ACCESSKEY = ""; // Your aws access key 
		final String SECRET_KEY = ""; // Your aws secret key
		final String bucketname = ""; // Your aws s3 bucket name

		try {
			System.out.println("----file uploading---");
			AmazonS3Client s3Client = new AmazonS3Client(new BasicAWSCredentials(ACCESSKEY, SECRET_KEY));

			PutObjectRequest request = new PutObjectRequest(bucketname, keyId, new File(file));
			request.setCannedAcl(CannedAccessControlList.PublicRead);
			s3Client.putObject(request);

			link = s3Client.getUrl(bucketname, keyId).toString();
			System.out.println("File uploaded");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return link;
	}
	
	public static String generatePassword() {

		int n = 8;
		// chose a Character random from this String 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(n); 
  
        for (int i = 0; i < n; i++) { 
  
            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
  
            // add Character one by one in end of sb 
            sb.append(AlphaNumericString 
                          .charAt(index)); 
        } 
  
        return sb.toString(); 
	}
	
	public static void sendMail(String receiver,String securityKey,String userName){

		final String from = "noreply.waterwastageprediction@gmail.com";
		final String username = userName;
		final String password = "Project_2020";

		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mails.smtp.ssl.trust","smtp.gmail.com");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(receiver));
			message.setSubject("Approve ");
			
			
			message.setText("Hello ,  " + userName + " your password is " + securityKey 
					 );

			Transport.send(message);
			
			System.out.println("Sent message successfully....");

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
}
