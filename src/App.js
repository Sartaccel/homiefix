import './App.css';
import Footer from './components/Footer';
import Hero from './components/Hero';
import Navbar from './components/Navbar';
import Services from './components/Service';
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
  return (

    
    <div className="App">
     <Navbar/>
     
     <Hero/>
     <Services/>
     <Footer/>

     
    </div>
    
  );
}

export default App;
