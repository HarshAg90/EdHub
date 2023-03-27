import React from 'react'
import { icons } from 'react-icons'
import {FaGoogle,FaAngleDoubleRight, FaDataba, FaAsterisk, FaAccusoft, FaDatabase} from 'react-icons/fa'
import './Hero.css'
import { Link } from 'react-router-dom';
import {useState} from 'react';

const Hero = () => {

    async function signin(event,UN,Mail,PW){
        event.preventDefault();
        console.log("event triggered");
        fetch('http://127.0.0.1:80/signup', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                "data": {
                    "username":UN,
                    "password": PW,
                    "email":Mail
                }
            })
        })
        .then(response => response.json())
        .then(data => {
            if(data.status == 1){
                status_change(true);
            }
            console.log(data);
        })
        .catch(error => console.error(error));
    }

    const [status, status_change] = useState(false);
    const [username, change_UserName] = useState("");
    const [id, change_id] = useState("");
    const [pass, change_pass] = useState("");

    return (
        <div className='hero'>
            <div className='container'>
                <div className='content'>
                    <div className='col-1'>
                        <h1><span className='primary-color'>Know Your Goal!</span></h1>
                        <h1>Discover your tech career path with ease</h1>
                        <p>Get personalized career roadmaps based on your interests.</p>
                        <button className='btn'>
<Link to='/about'>Know More</Link>
    </button>
                    </div>
                    
                    <div className='col-2'>
                        <div className='form-layout'>
                            <div className='form-container'>
                                <p className='sign-in-txt'>Sign in with</p>
                                <div className='social-login'>
                                    <span><FaGoogle size={20} /></span>
                                   
                                </div>
                                <div className='divider'>
                                    <p><span>Or</span></p>
                                </div>
                                <form action={()=>{signin(username,id,pass)}}>
                                    <input type='text' placeholder='Name' value={username} onChange={(e) => change_UserName(e.target.value)} />
                                    <input type='text' placeholder='Email' value={id} onChange={(e) => change_id(e.target.value)}/>
                                    <input type='text' placeholder='Password' value={pass} onChange={(e) => change_pass(e.target.value)}/>
                                    <button type="submit">Create Your Account</button>
                                </form>
                                {status?( <p>status</p>):""}
                            </div>
                            <div className='form-footer'>
                                <p>
                                    By signing up, you agree to our
                                    <span className='primary-color'> Terms, Data Policy</span>
                                     and <span className='primary-color'> Cookies Policy</span>.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
    )
};

export default Hero;