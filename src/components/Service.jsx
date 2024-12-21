import './Service.css'; // Ensure this is the correct path

import electrical from '../assets/electrician.png';
import plumbing from '../assets/plumber.png';
import carpentry from '../assets/carpenter.png';
import cleaning from '../assets/houseCleaning.png';
import vehicleService from '../assets/carService.png';
import cctv from '../assets/cctvCamera.png';
import careTaker from '../assets/earthCare.png';
import laundry from '../assets/laundry.png';
import homeAppliances from '../assets/homeAppliances.png';
import tentBuilder from '../assets/campingTent.png';
import homeDemolition from '../assets/homeDemolition.png';
import homeTuition from '../assets/tuition.png';
import interiorWorks from '../assets/interior.png';
import homeAutomation from '../assets/homeAutomation.png';
import homeShifters from '../assets/homeShifters.png';
import emergencyService from '../assets/24_7icon.png';

const Services = () => {
    return (
        <>
            <section>
                <div className="services">
                    <br />
                    <h1>Service Page</h1>
                    <br />
                    <div className="images">
                        <div className="card">
                            <img src={electrical} alt="Electrical Service" />
                            <h3>Electrical</h3>
                        </div>
                        <div className="card">
                            <img src={plumbing} alt="Plumbing Service" />
                            <h3>Plumbing</h3>
                        </div>
                        <div className="card">
                            <img src={carpentry} alt="Carpentry Service" />
                            <h3>Carpentry</h3>
                        </div>
                        <div className="card">
                            <img src={cleaning} alt="Cleaning Service" />
                            <h3>Cleaning</h3>
                        </div>
                        <div className="card">
                            <img src={vehicleService} alt="Vehicle Service" />
                            <h3>Vehicle Service</h3>
                        </div>
                        <div className="card">
                            <img src={cctv} alt="CCTV Service" />
                            <h3>CCTV Installation</h3>
                        </div>
                        {/* <div className="card">
                            <img src={careTaker} alt="Care Taker Service" />
                            <h3>Care Taker</h3>
                        </div> */}
                        {/* <div className="card">
                            <img src={laundry} alt="Laundry Service" />
                            <h3>Laundry</h3>
                        </div> */}
                        <div className="card">
                            <img src={homeAppliances} alt="Home Appliances Service" />
                            <h3>Home Appliances</h3>
                        </div>
                        {/* <div className="card">
                            <img src={tentBuilder} alt="Tent Builder Service" />
                            <h3>Tent Builder</h3>
                        </div> */}
                        {/* <div className="card">
                            <img src={homeDemolition} alt="Home Demolition Service" />
                            <h3>Home Demolition</h3>
                        </div> */}
                        {/* <div className="card">
                            <img src={homeTuition} alt="Home Tuition Service" />
                            <h3>Home Tuition</h3>
                        </div> */}
                        {/* <div className="card">
                            <img src={interiorWorks} alt="Interior Works Service" />
                            <h3>Interior Works</h3>
                        </div> */}
                        <div className="card">
                            <img src={homeAutomation} alt="Home Automation Service" />
                            <h3>Home Automation</h3>
                        </div>
                        <div className="card">
                            <img src={homeShifters} alt="Home Shifters Service" />
                            <h3>Home Shifters</h3>
                        </div>
                        {/* <div className="card">
                            <img src={emergencyService} alt="Emergency Service" />
                            <h3>Emergency Service</h3>
                        </div> */}
                    </div>
                </div>
                <br /> <br />
            </section>
        </>
    );
}

export default Services;
