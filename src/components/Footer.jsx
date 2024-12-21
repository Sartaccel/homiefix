import React from 'react';
import './Footer.css';

const Footer = () => {
    return (
        <>
            <section id='About'>
                <footer className="bg-light-grey text-light pt-4">
                    <br />
                    <div className="container">
                        <div className="text-center mb-4">
                            <br />
                            <p>We provide home repair services to make your life easier. Your satisfaction is our priority!</p>
                        </div>

                        <div className="row">
                            <div className="col-md-3 col-sm-6">
                                <h5>Electrical</h5>
                                <ul className="list-unstyled">
                                    <li>Wiring</li>
                                    <li>Lighting Installation</li>
                                    <li>Electrical Repairs</li>
                                    <li>Inspections</li>
                                </ul>
                            </div>

                            <div className="col-md-3 col-sm-6">
                                <h5>Plumbing</h5>
                                <ul className="list-unstyled">
                                    <li>Pipe Installation</li>
                                    <li>Drain Cleaning</li>
                                    <li>Leak Repairs</li>
                                    <li>Water Heater Services</li>
                                </ul>
                            </div>

                            <div className="col-md-3 col-sm-6">
                                <h5>Cleaning</h5>
                                <ul className="list-unstyled">
                                    <li>House Cleaning</li>
                                    <li>Bathroom Cleaning</li>
                                    <li>Sofa Cleaning</li>
                                    <li>Kitchen Cleaning</li>
                                </ul>
                            </div>

                            <div className="col-md-3 col-sm-6">
                                <h5>Vehicle Service</h5>
                                <ul className="list-unstyled">
                                    <li>General Service</li>
                                    <li>Repair Service</li>
                                    <li>Flat Tyres</li>
                                    <li>Water Wash</li>
                                </ul>
                            </div>
                        </div>

                        <div className="row mt-4">
                            <div className="col-md-3 col-sm-6">
                                <h5>CCTV Camera</h5>
                                <ul className="list-unstyled">
                                    <li>Installation</li>
                                    <li>Maintenance</li>
                                    <li>Consultation</li>
                                    <li>Repair Services</li>
                                </ul>
                            </div>

                            {/* <div className="col-md-3 col-sm-6">
                                <h5>Care Taker</h5>
                                <ul className="list-unstyled">
                                    <li>Old Age Care</li>
                                    <li>Pet Care</li>
                                    <li>Nursing Care</li>
                                    <li>Home Care</li>
                                </ul>
                            </div> */}

                            <div className="col-md-3 col-sm-6">
                                <h5>Home Appliances</h5>
                                <ul className="list-unstyled">
                                    <li>TV</li>
                                    <li>Computer</li>
                                    <li>Refrigerator</li>
                                    <li>Washing Machine</li>
                                </ul>
                            </div>

                            <div className="col-md-3 col-sm-6">
                                <h5>Carpentry</h5>
                                <ul className="list-unstyled">
                                    <li>Kitchen </li>
                                    <li>Furniture</li>
                                    <li>Wood Works</li>
                                    <li>Cupboard</li>
                                    
                                </ul>
                            </div>
                            <div className="col-md-3 col-sm-6">
                                <h5>Home Automation</h5>
                                <ul className="list-unstyled">
                                    <li>Smart Lighting</li>
                                    <li>Security Systems</li>
                                    <li>Smart Thermostats</li>
                                    <li>Home Networking</li>
                                </ul>
                            </div>
                        </div>

                        <div className="row mt-4">
                            {/* <div className="col-md-3 col-sm-6">
                                <h5>Home Automation</h5>
                                <ul className="list-unstyled">
                                    <li>Smart Lighting</li>
                                    <li>Security Systems</li>
                                    <li>Smart Thermostats</li>
                                    <li>Home Networking</li>
                                </ul>
                            </div> */}

                            <div className="col-md-3 col-sm-6">
                                <h5>Home Shifters</h5>
                                <ul className="list-unstyled">
                                    <li>Packers and Movers</li>
                                    <li>Storage Solutions</li>
                                    <li>Loading and Unloading</li>
                                    <li>Furniture Assembly</li>
                                </ul>
                            </div>

                            {/* <div className="col-md-3 col-sm-6">
                                <h5>Emergency Services</h5>
                                <ul className="list-unstyled">
                                    <li>24/7 Emergency Service</li>
                                    <li>Immediate Repairs</li>
                                    <li>Urgent Assistance</li>
                                    <li>Quick Response</li>
                                </ul>
                            </div> */}

                            <div className="col-md-3 col-sm-6">
                                <h5>Contact Us</h5>
                                <p>Email: support@homiefix.com</p>
                                <p>Phone: +123-456-7890</p>
                            </div>
                        </div>

                        <hr />
                        <div className="text-center pb-3">
                            <p>&copy; {new Date().getFullYear()} HomieFix. All rights reserved.</p>
                        </div>
                    </div>
                </footer>
            </section>
        </>
    );
}

export default Footer;