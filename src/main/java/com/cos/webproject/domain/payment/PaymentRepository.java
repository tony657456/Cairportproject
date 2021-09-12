package com.cos.webproject.domain.payment;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PaymentRepository extends JpaRepository<Payment, Integer> {

	@Query(value="SELECT * FROM payment WHERE user_id = :id", nativeQuery = true)
	List<Payment> mFindpayment(@Param("id") int id);
}
