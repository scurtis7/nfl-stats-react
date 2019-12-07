import React, {Component} from "react";
import {Container, Row, Badge} from 'reactstrap';

class Rankings extends Component {
    render() {
        return (
            <div>
                <Container fluid>
                    <Row>
                        <h1><Badge color="info">Rankings</Badge></h1>
                    </Row>
                    <Row>
                    </Row>
                </Container>
            </div>
        );
    }
}

export default Rankings;
