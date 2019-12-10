package com.scurtis.nflstats.controller;

import com.scurtis.nflstats.entity.team.Team;
import com.scurtis.nflstats.entity.team.TeamRepository;
import lombok.AllArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Author: Steve Curtis
 * Date: Dec 09, 2019
 **/
@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class TeamRestController {

    private final TeamRepository teamRepository;

    @GetMapping(value = "/teams", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Team> getAllTeams() {
        return teamRepository.findAll();
    }

}
