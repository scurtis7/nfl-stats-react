package com.scurtis.nflstats.entity.team;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Author: Steve Curtis
 * Date: Dec 09, 2019
 **/

@Entity
@Table(name = "Team")
@Data
@NoArgsConstructor
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence-generator")
    @SequenceGenerator(name = "sequence-generator", sequenceName = "team_sequence")
    @Column(name = "Id", unique = true, nullable = false)
    private Long id;

    @Column(name = "Code", unique = true, nullable = false)
    private String code;

    @Column(name = "FullName", nullable = false)
    private String fullName;

    @Column(name = "ShortName", nullable = false)
    private String shortName;

    @Column(name = "Conference", nullable = false)
    private String conference;

    @Column(name = "Division", nullable = false)
    private String division;


}
