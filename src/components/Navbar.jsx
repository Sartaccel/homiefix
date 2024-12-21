import React from 'react';
import './Navbar.css';
import logo from '../images/logo.png';

const Navbar = () => {
    return (
        <div className="navbar">
            <img src={logo} className="logoimg" alt="logo" style={{height:"100px",width:"175px"}} />

            <div className="links">
                <ul>
                    <li><a href="#Home">Home</a></li>
                    <li className="dropdown" >
                        <button className="dropbtn" id='service'>
                            Service
                            <span className="arrow">&#9662;</span>
                        </button>
                        <div className="dropdown-content">
                            <a href="#Electrical">Electrical</a>
                            <a href="#Plumbing">Plumbing</a>
                            <a href="#Carpentry">Carpentry</a>
                            <a href="#Cleaning">Cleaning</a>
                            <a href="#VehicleService">Vehicle Service</a>
                            <a href="#CCTVInstallation">CCTV Installation</a>
                            {/* <a href="#CareTaker">Care Taker</a>
                            <a href="#Laundry">Laundry</a> */}
                            <a href="#HomeAppliances">Home Appliances</a>
                            {/* <a href="#TentBuilder">Tent Builder</a>
                            <a href="#HomeDemolition">Home Demolition</a>
                            <a href="#HomeTuition">Home Tuition</a>
                            <a href="#InteriorWorks">Interior Works</a> */}
                            <a href="#HomeAutomation">Home Automation</a>
                            <a href="#HomeShifters">Home Shifters</a>
                            {/* <a href="#EmergencyService">Emergency Service</a> */}
                        </div>
                    </li>
                    <li><a href="#About">About</a></li>
                </ul>
            </div>
        </div>
    );
}

export default Navbar;