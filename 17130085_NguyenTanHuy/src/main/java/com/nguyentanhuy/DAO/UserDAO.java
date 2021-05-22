package com.nguyentanhuy.DAO;

import java.util.ArrayList;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.util.HibernateUtil;
import com.nguyentanhuy.entities.User;

public class UserDAO {

	@Autowired
	private User user;

	public boolean insertUser(User user) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();

		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		session.close();
		return true;
	}
	public boolean isExistEmail(String email) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		String sql = "from User u where u.email = :myEmail";
		Query query = session.createQuery(sql);
		query.setParameter("myEmail", email);
		List<User> listUser = query.getResultList();
		
		session.getTransaction().commit();
		
		if (listUser.size() == 0)
			return false;
		if(listUser.size()!=0)
			return true;
		session.close();
		return false;
	}
	
	public List<User> getMemberList(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		String sql = "from User";
		Query query = session.createQuery(sql);
		List<User> listUser = query.getResultList();
		session.close();
		return listUser;
	}
	
	public List<User> chooseGender(String gender){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		String sql = "";
		List<User> listUser =  new ArrayList<User>();
		if(gender.equals("Nữ")) {
			sql = "from User u where u.female = :myGender";
			Query<User> query = session.createQuery(sql);
			query.setParameter("myGender", true);
			listUser = query.getResultList();
		}
		if(gender.equals("Nam")) {
			sql = "from User u where u.female = :myGender";
			Query query = session.createQuery(sql);
			query.setParameter("myGender", false);
			listUser = query.getResultList();
		}
		if(gender.equals("")){
			sql = "from User u";
			Query query = session.createQuery(sql);
			listUser = query.getResultList();
		}
		System.out.println(listUser);
		session.getTransaction().commit();
		session.close();
		return listUser;
	}
	
	public User getMemberDetail(String email) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		user = session.get(User.class, email);
		session.getTransaction().commit();
		session.close();
		return user;
	}

	public static void main(String[] args) {
		UserDAO u = new UserDAO();
//System.out.println(u.isExistEmail("a@gmail.com"));
		//System.out.println(u.getMemberList());
//		System.out.println(u.chooseGender("Nam"));
		System.out.println(u.getMemberDetail("lanpham@yahoo.com.vn"));
	}
}
