package com.nguyentanhuy.entities;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.springframework.context.annotation.Primary;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "thanhvien")
public class User implements Serializable{
	
	@Id
	@Column(name="email")
	@Email(message="Email không hợp lệ")
	@NotNull(message="Bạn không thể để trống dữ liệu này")
	private String email;
	
	@Column(name="matkhau")
	@NotNull(message="Bạn không thể để trống dữ liệu này")
	@Size(min=8, message= "Mật khẩu ít nhất 8 ký tự")
	private String password;

	@Column(name = "hoten")
	@NotNull(message="Bạn không thể để trống dữ liệu này")
	private String userName;

	@Column(name = "ngaysinh")
	@NotNull(message="Bạn không thể để trống dữ liệu này")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date birthday;
	
	@Column(name = "nu")
	private boolean female;
	
	@Column(name = "tdvanhoa")
	private String education;
	
	@Column(name = "diachi")
	private String address;
	
	@Column(name = "dienthoai")
//	@Pattern(regexp="(^$|[0-9]{10})")
	private String phone;
	
	public User() {}
	
	public User(String email, String password, String userName, Date birthday, boolean isFemale, String education,
			String address, String phone) {
		this.email = email;
		this.password = password;
		this.userName = userName;
		this.birthday = birthday;
		this.female = female;
		this.education = education;
		this.address = address;
		this.phone = phone;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public boolean isFemale() {
		return female;
	}

	public void setFemale(boolean female) {
		this.female = female;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "User [ email=" + email + ", password=" + password + ", userName=" + userName
				+ ", birthday=" + birthday + ", isFenale=" + female + ", education=" + education + ", address=" + address
				+ ", phone=" + phone + "]";
	}
	
//	<%@ taglib prefix="fmt" uri="http://Java.Sun.com/jsp/jstl/fmt" %>
//
//	<fmt:formatDate pattern="MM/dd/yyyy" value="${widget.created}" />

}

