package com.scurtis.nflstats.entity.team;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Author: Steve Curtis
 * Date: Dec 09, 2019
 **/
@Repository
public interface TeamRepository extends JpaRepository<Team, Long> {

}
