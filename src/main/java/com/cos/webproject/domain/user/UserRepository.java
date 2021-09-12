package com.cos.webproject.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	// username만 못가져오네?? 검색했을 때 무조건 가져와야 하는 컬럼이 있나??
	// 아 수업할 때 하나만 못가져오고 null을 줘서 가져왔었다ㅠㅠㅠㅠㅠ
	@Query(value="SELECT * FROM user WHERE username = :username", nativeQuery = true)
	User mFindUsername(@Param("username") String username);
	
	@Query(value="SELECT * FROM user WHERE username = :username AND password = :password", nativeQuery = true)
	User mLogin(@Param("username") String username, @Param("password") String password);
	
}
