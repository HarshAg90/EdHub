import React, {useState} from "react";
import "./PageTwo.css";

const PageTwo = ({onButtonClick}) => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");

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
        <div style={{ marginBottom: "1rem" }}>
          <label style={{ display: "block", marginBottom: "0.5rem", color:"white" }}>Course:</label>
          <input
            type="text"
            name="name"
            value={name}
            onChange={handleNameChange}
            placeholder={"Enter your Course"}
            style={{
              padding: "0.5rem",
              borderRadius: "5px",
              border: "1px solid #ccc",
              width: "100%",
              boxSizing: "border-box",
            }}
          />
        </div>
        <div style={{ marginBottom: "1rem" }}>
          <label style={{ display: "block", marginBottom: "0.5rem", color:"white" }}>Year of Studying</label>
          <input
            type="number"
            name="number"
            value={email}
            placeholder={"Enter Your Year of Studying"}
            onChange={handleEmailChange}
            style={{
              padding: "0.5rem",
              borderRadius: "5px",
              border: "1px solid #ccc",
              width: "100%",
              boxSizing: "border-box",
          
            }}
          />
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
          } }onClick={() => onButtonClick("pagethree")}
        >
          Next
        </button>
      </form>
  
      </main>
    );
}

export default PageTwo;