package com.cos.webproject.domain.payment;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.cos.webproject.domain.planeticket.PlaneTicket;
import com.cos.webproject.domain.user.User;

import lombok.Data;

@Data
@Entity
public class Payment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	// 1:N 관계에서 N에다가 외래키를 넣는 경우가 많다.
	// 구매내역에은 한명의 user 정보만 들어올 수 있으니까 원자성 법칙을 위반하지 않는다.(id가 여러 개 들어가지 않음 한 튜플에)
	// 하지만 user는 여러가지 payment 정보를 가질 수 있다.(이렇게 되면 한 튜플에 여러개의 id가 들어감(원자성 법칙에 걸림)
	// 그래서 payment에 user를 넣어서 외래키로 만들어 준것이다.
	// 하지만 그렇다 쳐도 자바에서는 오브젝트를 만들 수 있지만 db에서는 그렇지 못하다. 
	// 이게 무슨말이냐면 데이터베이스에서 조인을 해서 테이블의 값들을 다 들고온다.
	/*
	 * SELECT * FROM user u JOIN payment p ON u.id = p.user_id WHERE p.id=1;
	 */
	// 이런식으로 내가 payment id 1번을 검색하면 그 안에 외래키로 있는 user_id가 실제 user 프라이머리키 id랑 같으면 데이터를
	// 들고 오라고 join을 해준다.
	// 하지만 자바에서는 User 객체를 넣지 않고 user_id만 넣어두고 진행을 하게 되면 데이터베이스에서는 쿼리문을 작성할 수 있지만
	// 자바에서는 난 아직 초보개발자라서 작성하지 못한다. 그걸 떠나서 힘든걸 알 수 있다. Repository에서 쿼리문을 직접 작성해서
	// 사용하면 가능하지 싶다!!
	// 그렇다고 그냥 오브젝트를 넣기에는 데이터베이스의 원자성 법칙이 깨져버리기 때문에 난감한 상황이 생긴다.
	// 하지만 우리에겐 JPA의 기능인 ORM 기법이 있다.
	// 자바에서 오브젝트를 넣어도 데이터베이스에서는 user_id라는 외래키로 저장될 뿐만 아니라
	// 기본으로 제공해주는 findById() 함수를 사용하면 알아서 위에 적은 쿼리문을 실행해준다. 
	   -> ... 위에 있는 쿼리문은 JOIN을 활용해서 userid와 payment
	// 만약 테이블이 엄청 많고 방대하다면 위에있는 쿼리문을 Repository마다 적어야 할것이다....
	// 이런 기본적으로 제공해주는 함수까지 있으니 난 잘 활용만 하면 된다!!
	
	@ManyToOne
	private User user;
	
	@ManyToOne
	private PlaneTicket planeTicket;

}
