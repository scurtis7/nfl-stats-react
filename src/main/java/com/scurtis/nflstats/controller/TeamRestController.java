package com.scurtis.nflstats.controller;

import com.scurtis.nflstats.entity.team.Team;
import com.scurtis.nflstats.entity.team.TeamRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Author: Steve Curtis
 * Date: Dec 09, 2019
 **/
@RestController
@RequestMapping("/api")
@AllArgsConstructor
@Slf4j
public class TeamRestController {

    private final TeamRepository teamRepository;

    @GetMapping(value = "/teams", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Team> getAllTeams() {
        log.info("Method: getAllTeams()");
        return teamRepository.findAll();
    }

    @GetMapping(value = "/teams/conference/{conference}/division/{division}/sortColumn/{column}/sortOrder/{order}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Team> filterTeams(@PathVariable("conference") String conference,
                                  @PathVariable("division") String division,
                                  @PathVariable("column") String column,
                                  @PathVariable("order") String order) {
        log.info("Method: filterTeams(conference:{}, division:{}, column:{}, order:{})", conference, division, column, order);

//        List<String> properties = Collections.singletonList(column);
//        Sort sort = new Sort(ASC, "division");

        return teamRepository.findTeamsByConferenceAndDivision(conference, division);
    }

    @GetMapping(value = "/teamcodes", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<String> getTeamCodes() {
        log.info("Method: getTeamCodes()");
        return teamRepository.findTeamCodes();
    }

    @GetMapping(value = "/conferences", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<String> getConferences() {
        log.info("Method: getConferences()");
        return teamRepository.findConferences();
    }

    @RequestMapping(value = "/divisions", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<String> getDivisions() {
        log.info("Method: getDivisions()");
        return teamRepository.findDivisions();
    }

}
