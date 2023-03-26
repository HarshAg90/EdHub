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
        {/* <form className="measure">
          <h2>Let's set up a home for all your work</h2>
          <p style={{ color: "#C0C0C0" }}>
            You can always create another workspace later.
          </p>
          <fieldset id="sign_up" className="ba b--transparent ph0 mh0">
            <div className="mt3">
              <label
                className="left db lh-copy f6 mb1"
                htmlFor="workspace-name"
                style={{textAlign: 'left'}}
              >
                Workspace Name
              </label>
              <input
                className="f6 br2 ph3 pv2 mb2 dib black w-100"
                type="text"
                name="workspace-name"
                id="workspace-name"
                size="30"
                placeholder="Eden"
                style={{
                  borderStyle: "solid",
                  borderWidth: "1px",
                  borderColor: "#EAEEF5",
                }}
              />
            </div>
            <div className="mv3">
              <label className="db lh-copy f6 mb1" htmlFor="workspace-url" style={{textAlign: 'left'}}>
                Workspace URL
                <span className="ml1" style={{ color: "#C0C0C0" }}>
                  {" "}
                  (optional)
                </span>
              </label>
              <div className="center urlButton br2 mt1">
              <button class="dropbtn urlInput f6 br2 ph2 pv2">www.eden.com/</button>
              <input
                className="f6 ph3 pv2 dib br2 black w-100"
                type="url"
                name="workspace-url"
                id="workspace-url"
                placeholder="Example"
                style={{
                  borderStyle: "solid",
                  borderWidth: "1px",
                  borderColor: "#EAEEF5",
                }}
              />
              </div>
            </div>
          </fieldset>
          <div className="">
            <input
              className="f6 grow br2 ph3 pv2 mb2 dib white"
              style={{ borderStyle: "none", width: "100%", backgroundColor: '#664DE5' }}
              type="submit"
              value="Create Workspace"
              onClick={() => onButtonClick("pagethree")}
            />
          </div>
        </form> */
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
        }
      </main>
    );
}

export default PageTwo;