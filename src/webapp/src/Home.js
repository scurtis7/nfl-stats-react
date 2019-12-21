import React, {Component} from "react";
import "./Home.css"
import SubPage1 from "./SubPage1";
import SubPage2 from "./SubPage2";
import SubPage3 from "./SubPage3";
import SubPage4 from "./SubPage4";
import SubPage5 from "./SubPage5";
import {BrowserRouter, Route, NavLink, Link} from "react-router-dom";
import {Nav, NavItem, Container, Row, Col} from 'reactstrap';

class Home extends Component {
    render() {
        return (
            <BrowserRouter>
                <Container fluid>
                    <Row>
                        <Col xs="2">
                            <div className="Home">
                                <Nav vertical>
                                    <NavItem className="navitem-vert"><NavLink className="navlink-vert" activeClassName="navlink-vert-active" to="/subpage1">Sub Page 1</NavLink></NavItem>
                                    <NavItem className="navitem-vert"><NavLink className="navlink-vert" activeClassName="navlink-vert-active" to="/subpage2">Sub Page 2</NavLink></NavItem>
                                    <NavItem className="navitem-vert"><NavLink className="navlink-vert" activeClassName="navlink-vert-active" to="/subpage3">Sub Page 3</NavLink></NavItem>
                                    <NavItem className="navitem-vert"><NavLink className="navlink-vert" activeClassName="navlink-vert-active" to="/subpage4">Sub Page 4</NavLink></NavItem>
                                    <NavItem className="navitem-vert"><NavLink className="navlink-vert" activeClassName="navlink-vert-active" to="/subpage5">Sub Page 5</NavLink></NavItem>
                                </Nav>
                            </div>
                        </Col>
                        <Col xs="auto" className="column-menu">
                            <div className="content">
                                <Route path="/subpage1" component={SubPage1}/>
                                <Route path="/subpage2" component={SubPage2}/>
                                <Route path="/subpage3" component={SubPage3}/>
                                <Route path="/subpage4" component={SubPage4}/>
                                <Route path="/subpage5" component={SubPage5}/>
                            </div>
                        </Col>
                    </Row>
                </Container>
            </BrowserRouter>
        );
    }
}

export default Home;
