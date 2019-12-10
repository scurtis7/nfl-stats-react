import React, {Component} from "react";
import axios from 'axios';
import JSONPretty from 'react-json-pretty';
import 'react-json-pretty/themes/monikai.css';

class Teams extends Component {

    constructor(props) {
        super(props);
        this.state = {
            teams: null,
        };
        this.setTeams = this.setTeams.bind(this);
    }

    setTeams(teams) {
        this.setState({ teams });
    }

    componentDidMount() {
        axios(`http://localhost:8080/api/teams`)
            .then(teams => this.setTeams(teams))
            .catch(error => error);
    }

    render() {
        return (
            <div>
                <JSONPretty data={this.state.teams} theme={1337} onJSONPrettyError={e => console.error(e)} />
            </div>
        );
    }
}

export default Teams;
