import React, {useState} from "react";
import "./PageThree.css";

const PageTwo = ({onButtonClick}) => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [selectedOption, setSelectedOption] = useState('');

  const handleOptionChange = (event) => {
    setSelectedOption(event.target.value);
  };

  const handleNameChange = (e) => {
    setName(e.target.value);
  };

  const handleEmailChange = (e) => {
    setEmail(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(`Name: ${name}, Email: ${email}`);
  };
    return (
      <main
        className="pt5 black-80 center"
        style={{ maxWidth: "40%", maxHeight: "30%", margin: "auto" }}
      >
        <div className="page-two">
        <h2>Some Personal Info</h2>
        <p style={{ color: "#C0C0C0", textAlign: "center" }}>Please provide us some more info..</p>
        </div>
       
        <form style={{ maxWidth: "400px", margin: "0 auto" }} onSubmit={handleSubmit}>
        <div>
          <label style={{ display: "block", color:"white" }}>Course:</label>
          <input
            type="text"
            name="name"
            value={name}
            onChange={handleNameChange}
            placeholder={"Enter your Course"}
            style={{
              borderRadius: "5px",
              border: "1px solid #ccc",
              width: "100%",
              boxSizing: "border-box",
            }}
          />
        </div>
        <div>
          <label style={{ display: "block", color:"white" }}>Year of Studying</label>
          <input
            type="number"
            name="number"
            value={email}
            placeholder={"Enter Your Year of Studying"}
            onChange={handleEmailChange}
            style={{
              borderRadius: "5px",
              border: "1px solid #ccc",
              width: "100%",
              boxSizing: "border-box",
          
            }}
          />
        </div>
        <div className="dropdown-container">
      <label htmlFor="options" className="dropdown-label">Select Your Interests</label>
      <select id="options" value={selectedOption} onChange={handleOptionChange}>
        <option value="">Select an option</option>
        <option value="AI">AI</option>
        <option value="ML">ML</option>
        <option value="Web Development">Web Development</option>
        <option value="Data Science">Data Science</option>
        <option value="DSA">DSA</option>
      </select>
    </div>


        
        <button
          type="submit"
          style={{
            backgroundColor: "black",
            color: "white",
            padding: "0.8rem",
            borderRadius: "5px",
            border: "none",
            cursor: "pointer",
            width: "40%",
            float:"right"
          } }onClick={() => onButtonClick("pagefour")}
        >
          Next
        </button>
      </form>
        
      </main>
    );
}

export default PageTwo;