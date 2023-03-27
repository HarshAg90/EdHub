import React, {useState} from "react";
import "./PageOne.css";


const PageOne = ({ onButtonClick}) => {
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
      <div className="page-one">
        <h2>Welcome to LearnLog</h2>
        <p style={{ color: "#C0C0C0" , textAlign: "center", marginBottom:" 1.3rem" }}>Please provide us some info..</p>
        </div>
        <form style={{ maxWidth: "400px", margin: "0 auto" }} onSubmit={handleSubmit}>
      <div>
        <label style={{ display: "block", color:"white" }}>Name:</label>
        <input
          type="text"
          name="name"
          value={name}
          onChange={handleNameChange}
          placeholder={"Enter your name"}
          style={{
            padding: "0.3rem",
            borderRadius: "3px",
            border: "1px solid #ccc",
            width: "100%",
            boxSizing: "border-box",
          }}
        />
      </div>
      <div>
        <label style={{ display: "block", color:"white" }}>Email:</label>
        <input
          type="email"
          name="email"
          value={email}
          placeholder={"Enter Your Email"}
          onChange={handleEmailChange}
          style={{
            padding: "0.3rem",
            borderRadius: "3px",
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
        } }onClick={() => onButtonClick("pagetwo")}
      >
        Next
      </button>
    </form>
        {/* <fieldset>
          <div className="mt3">
            <label
              className="db lh-copy f6 mb1"
              htmlFor="full-name"
              style={{ textAlign: "left" }}
            >
              Full Name
            </label>
            <input
              type="text"
              name="full-name"
              id="full-name"
              size="30"
              placeholder="Steve Jobs"
              style={{
                borderStyle: "solid",
                borderWidth: "1px",
                borderColor: "#EAEEF5",
              }}
            />
          </div>
          <div className="mv3">
            <label
              className="db lh-copy f6 mb1"
              htmlFor="display-name"
              style={{ textAlign: "left" }}
            >
              Display Name
            </label>
            <input
              className="f6 br2 ph3 pv2 mb2 dib black w-100"
              type="text"
              name="display-name"
              id="display-name"
              placeholder="Steve"
              style={{
                borderStyle: "solid",
                borderWidth: "1px",
                borderColor: "#EAEEF5",
              }}
            />
          </div>
        </fieldset>
        <div>
          <input
            className="f6 grow br2 ph3 pv2 mb2 dib white"
            style={{
              borderStyle: "none",
              width: "100%",
              backgroundColor: "#664DE5",
            }}
            type="submit"
            value="Create Workspace"
            onClick={() => onButtonClick("pagetwo")}
          />
        </div> */}
    </main>
  );
};

export default PageOne;
