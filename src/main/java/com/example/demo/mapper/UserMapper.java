
package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.entity.User;

@Mapper
public interface UserMapper {

	/**　メールアドレスでユーザを検索する*/
	@Select("SELECT * FROM users WHERE email =#{email}")
	User findByEmail(String email);

	@Insert("INSERT INTO users(name, password , email, job_id, level,prefecture_id, role)"
			+ " VALUES(#{name}, #{password}, #{email}, #{job_id}, #{level}, #{prefecture_id}, #{role})")
	void insert(User user);

	// @Select("SELECT id, name, job_id, level, prefecture_id, role FROM users WHERE id =#{userid}")
	User findByUserid(int userid);

	void update(User user);

	/** ユーザーランキングの取得 */
	List<User> findUsersTop3();

	void updateLevel(int userId, int level);

	List<Integer> findUsersTop3Amount();
}
