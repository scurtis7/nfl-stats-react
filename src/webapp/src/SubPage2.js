import React, {Component} from "react";
import {Container, Row, Badge} from 'reactstrap';

class SubPage2 extends Component {
    render() {
        return (
            <div>
                <Container fluid>
                    <Row>
                        <h1><Badge color="info">Sub Page 2</Badge></h1>
                    </Row>
                    <Row>
                    </Row>
                </Container>
            </div>
        );
    }
}

export default SubPage2;
