import React, {Component} from "react";
import './Teams.css';
import axios from 'axios';
import {Table} from 'reactstrap';

class Teams extends Component {

    constructor(props) {
        super(props);
        this.state = {
            teams: [],
        };
        this.setTeams = this.setTeams.bind(this);
        this.loadTableData = this.loadTableData.bind(this);
    }

    setTeams(teams) {
        this.setState({teams});
    }

    loadTableData() {
        if (this.state.teams === null) {
            return (
                <tr><td colSpan="6">Loading...</td></tr>
            );
        } else {
            return this.state.teams.map((team, index) => {
                const {id, code, fullName, shortName, conference, division} = team; //destructuring
                return (
                    <tr key={index}>
                        <td>{id}</td>
                        <td>{code}</td>
                        <td>{fullName}</td>
                        <td>{shortName}</td>
                        <td>{conference}</td>
                        <td>{division}</td>
                    </tr>
                );
            });
        }
    }

    componentDidMount() {
        axios(`http://localhost:8080/api/teams`)
            .then(teams => this.setTeams(teams.data))
            .catch(error => error);
    }

    render() {
        return (
            <div className="Teams-div">
                <Table className="Teams-table">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Code</th>
                        <th>Full Name</th>
                        <th>Short Name</th>
                        <th>Conference</th>
                        <th>Division</th>
                    </tr>
                    </thead>
                    <tbody>
                    {this.loadTableData()}
                    </tbody>
                </Table>
            </div>
        );
    }
}

export default Teams;
