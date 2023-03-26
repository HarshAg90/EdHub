import React from 'react'
import { icons } from 'react-icons'
import {FaGoogle,FaAngleDoubleRight, FaDataba, FaAsterisk, FaAccusoft, FaDatabase} from 'react-icons/fa'
import './Hero.css'
import { Link } from 'react-router-dom';

const Hero = () => {

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
                                <form action=''>
                                    <input type='text' placeholder='Name' />
                                    <input type='text' placeholder='Email' />
                                    <input type='text' placeholder='Password' />
                                    <button>Create Your Account</button>
                                </form>
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