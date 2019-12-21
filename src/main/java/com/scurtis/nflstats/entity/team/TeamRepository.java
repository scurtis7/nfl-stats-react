package com.scurtis.nflstats.entity.team;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author: Steve Curtis
 * Date: Dec 09, 2019
 **/
@Repository
public interface TeamRepository extends JpaRepository<Team, Long> {

    @Query(value = "SELECT DISTINCT t.code FROM Team t ORDER BY t.code")
    List<String> findTeamCodes();

    @Query(value = "SELECT DISTINCT t.conference FROM Team t ORDER BY t.conference")
    List<String> findConferences();

    @Query(value = "SELECT DISTINCT t.division FROM Team t ORDER BY t.division")
    List<String> findDivisions();

    @Query("SELECT t FROM Team t WHERE t.conference = :conference and t.division = :division")
    List<Team> findTeamsByConferenceAndDivision(@Param("conference") String conference,
                                                @Param("division") String division);

}
