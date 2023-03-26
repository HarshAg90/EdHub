import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import About from './components/About';
import Faq from './components/Faq';
import Contact from './components/Contact';
import MultiStepProgressBar from "./components/MultiStepProgressBar/MultiStepProgressBar";
import PageOne from "./components/PageOne/PageOne";
import PageThree from "./components/PageThree/PageThree";
import PageFour from "./components/PageFour/PageFour";
import PageTwo from './components/PageTwo/PageTwo';
import './components/Form.css'

function App() {
  const [page, setPage] = useState("pageone");

  const nextPage = (page) => {
    setPage(page);
  };

  const nextPageNumber = (pageNumber) => {
    switch (pageNumber) {
      case "1":
        setPage("pageone");
        break;
      case "2":
        setPage("pagetwo");
        break;
      case "3":
        setPage("pagethree");
        break;
      case "4":
        alert("Ooops! Seems like you did not fill the form.");
        break;
      default:
        setPage("1");
    }
  };

  return (
    <>
      <Router>
        <Routes>
          <Route path="/" element={<>
            <Navbar />
            <Hero />
          </>} />
          <Route path="/about" element={<><Navbar /> <About /></>} />
          <Route path="/faq" element={ <><Navbar /><Faq /></>} />
          <Route path="/contact" element={ <><Navbar /> <Contact /></>} />
          {/* <Route path="/form" element={<>
            <MultiStepProgressBar page={page} onPageNumberClick={nextPageNumber} onButtonClick={nextPage} />
            {
              {
                pageone: <PageOne onButtonClick={nextPage} />,
                pagetwo: <PageTwo onButtonClick={nextPage} />,
                pagethree: <PageThree onButtonClick={nextPage} />,
                pagefour: <PageFour />,
              }[page]
            }
            
          </>} /> */}
    <Route path="/form" element={
  <div className="form-page-container">
    <MultiStepProgressBar page={page} onPageNumberClick={nextPageNumber} onButtonClick={nextPage} />
    {
      {
        pageone: <PageOne onButtonClick={nextPage} />,
        pagetwo: <PageTwo onButtonClick={nextPage} />,
        pagethree: <PageThree onButtonClick={nextPage} />,
        pagefour: <PageFour />,
      }[page]
    }
  </div>
} />



        </Routes>
      </Router>
    </>
  );
}

export default App;
