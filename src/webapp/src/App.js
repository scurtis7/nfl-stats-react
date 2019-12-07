import React, {Component} from 'react';
import Home from "./Home";
import Teams from "./Teams";
import Players from "./Players";
import Games from "./Games";
import Rankings from "./Rankings";
import DataLoad from "./DataLoad";
import About from "./About";
import SignIn from "./SignIn";
import {BrowserRouter, Route, NavLink, Link} from "react-router-dom";
import {Collapse, Nav, Navbar, NavbarBrand, NavbarToggler, NavItem} from "reactstrap";

class App extends Component {

    constructor(props) {
        super(props);
        this.state = {isOpen: false};
        this.toggle = this.toggle.bind(this);
    }

    toggle() {
        this.setState({
            isOpen: !this.state.isOpen
        });
    }

    render() {
        return (
            <BrowserRouter>
                <div>
                    <Navbar color="dark" dark expand="md">
                        <NavbarBrand tag={Link} exact="true" to="/">NFL Stats</NavbarBrand>
                        <NavbarToggler onClick={this.toggle}/>
                        <Collapse isOpen={this.state.isOpen} navbar>
                            <Nav className="mr-auto" navbar>
                                <NavItem><NavLink className="navlink" activeClassName="navlinkactive" to="/teams">Teams</NavLink></NavItem>
                                <NavItem><NavLink className="navlink" activeClassName="navlinkactive" to="/players">Players</NavLink></NavItem>
                                <NavItem><NavLink className="navlink" activeClassName="navlinkactive" to="/games">Games</NavLink></NavItem>
                                <NavItem><NavLink className="navlink" activeClassName="navlinkactive" to="/rankings">Rankings</NavLink></NavItem>
                                <NavItem><NavLink className="navlink" activeClassName="navlinkactive" to="/dataload">Data Load</NavLink></NavItem>
                            </Nav>
                            <Nav className="ml-auto" navbar>
                                <NavItem><NavLink className="navlink" activeClassName="navlinkactive" to="/about">About</NavLink></NavItem>
                                <NavItem><NavLink className="navlink" activeClassName="navlinkactive" to="/signin">Sign In</NavLink></NavItem>
                            </Nav>
                        </Collapse>
                    </Navbar>
                </div>
                <div className="content">
                    <Route exact path="/" component={Home}/>
                    <Route path="/teams" component={Teams}/>
                    <Route path="/players" component={Players}/>
                    <Route path="/games" component={Games}/>
                    <Route path="/rankings" component={Rankings}/>
                    <Route path="/dataload" component={DataLoad}/>
                    <Route path="/about" component={About}/>
                    <Route path="/signin" component={SignIn}/>
                </div>
            </BrowserRouter>
        );
    }
}

export default App;
