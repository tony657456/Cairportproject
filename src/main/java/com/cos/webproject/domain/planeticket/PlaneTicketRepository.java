package com.cos.webproject.domain.planeticket;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PlaneTicketRepository extends JpaRepository<PlaneTicket, Integer>{
	
	// and가 아니라 저 두 값이 
	@Query(value="SELECT * FROM plane_ticket WHERE depairportnm = :depairportnm OR arrairportnm = :arrairportnm" , nativeQuery = true)
	List<PlaneTicket> mFindPlaneTicket(@Param("depairportnm") String depairportnm, @Param("arrairportnm") String arrairportnm);
}
