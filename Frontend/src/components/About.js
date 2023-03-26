// import React from 'react';
  
// const About = () => {
//   return (
//     <div
//       style={{
//         display: 'flex',
//         justifyContent: 'Center',
//         alignItems: 'Center',
//         height: '100vh'
//       }}
//     >
//       <h1>Know about us!</h1>
//     </div>
//   );
// };
  
// export default About;

import React from 'react';
import './About.css';

function About() {
  return (
    <div className="about-page">
      <h1>About Us</h1>
      <p>Welcome to our tech career guidance web app!</p>
      <p>Our mission is to help students discover their tech career path by providing personalized roadmaps based on their interests and access to relevant courses and resources.</p>
      <p>In addition, we aim to foster a supportive community of like-minded students who can share knowledge, opportunities, and advice.</p>
      <p>Our team of experienced tech professionals and educators has carefully curated a database of courses, resources, and industry insights to help you make informed decisions about your tech career.</p>
      <p>Thank you for choosing our app as your guide to the exciting world of tech!</p>
      <div className="team-section">
        <h2>Meet Our Team</h2>
        <div className="team-member">
          <img src="https://via.placeholder.com/150" alt="Profile" />
          <h3>Anas</h3>
          <p>FrontEnd Dev.</p>
        </div>
        <div className="team-member">
          <img src="https://via.placeholder.com/150" alt="Profile" />
          <h3>Harsh</h3>
          <p>Backend Dev.</p>
        </div>
        <div className="team-member">
          <img src="https://via.placeholder.com/150" alt="Profile" />
          <h3>Amanjot</h3>
          <p>APP Dev.</p>
        </div>
      </div>
    </div>
  );
}

export default About;