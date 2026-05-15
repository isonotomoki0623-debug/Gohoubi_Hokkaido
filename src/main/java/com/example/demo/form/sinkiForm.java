package com.example.demo.form;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class sinkiForm {
	
	@NotBlank(message = "名前は必須です")
	 private String name;

	 @NotBlank(message = "メールアドレスは必須です")
	 @Email(message = "メールアドレスの形式が正しくありません")
	 private String email;

	 @NotBlank(message = "パスワードは必須です")
	 //@Size(min = 6, message = "パスワードは6文字以上で入力してください")
	 private String password;
	 
	 @NotNull(message = "選択してください")
	 private int job_id;
	 @NotNull(message = "選択してください")
	 private int prefectures_id;
	

	public String getName() {
	  return name;
	}
	public void setName(String name) {
	  this.name = name;
	}
	public String getEmail() {
	  return email;
	}
	public void setEmail(String email) {
	  this.email = email;
	}
	public String getPassword() {
	  return password;
	}
	public void setPassword(String password) {
	  this.password = password;
	}
	
	public int getJob_id() {
		return job_id;
	}
	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}
	public int getPrefectures_id() {
		return prefectures_id;
	}
	public void setPrefectures_id(int prefectures_id) {
		this.prefectures_id = prefectures_id;
	}
}
