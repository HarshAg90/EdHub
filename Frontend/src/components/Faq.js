// import React from 'react';
  
// const Faq = () => {
//   return (
//     <div
//       style={{
//         display: 'flex',
//         justifyContent: 'Center',
//         alignItems: 'Center',
//         height: '100vh'
//       }}
//     >
//       <h1>Here are fome FAQs</h1>
//     </div>
//   );
// };
  
// export default Faq;

import React, { useState } from 'react';
import './Faq.css';

function Faq() {
  const [activeIndex, setActiveIndex] = useState(null);

  const toggleAccordion = (index) => {
    setActiveIndex(activeIndex === index ? null : index);
  };

  const faqData = [
    {
      question: 'What is this web app for?',
      answer:
        'This web app is designed to help students discover their tech career path by providing personalized roadmaps based on their interests and access to relevant courses and resources.',
    },
    {
      question: 'How does the app work?',
      answer:
        'Users provide their interests and the app provides a list of suitable roadmaps, along with links to relevant courses and resources. The app also provides access to a community of like-minded students.',
    },
    {
      question: 'Is the app free to use?',
      answer: 'Yes, the app is completely free to use.',
    },
    {
      question: 'Who developed the app?',
      answer:
        'The app was developed by a team of experienced tech professionals and educators with a passion for helping students find their tech career path.',
    },
    {
      question: 'How can I contribute to the app?',
      answer:
        'We welcome contributions from users in the form of feedback, suggestions, and content recommendations. Please feel free to reach out to us via the Contact Us page.',
    },
  ];

  return (
    <div className="faq-page">
      <h1>Frequently Asked Questions</h1>
      {faqData.map((item, index) => (
        <div
          className={`accordion-item ${
            index === activeIndex ? 'active' : ''
          }`}
          key={index}
          onClick={() => toggleAccordion(index)}
        >
          <div className="accordion-title">{item.question}</div>
          <div className="accordion-content">{item.answer}</div>
        </div>
      ))}
    </div>
  );
}

export default Faq;