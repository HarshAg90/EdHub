import React, { useState } from 'react';
import { FaBars, FaTimes } from 'react-icons/fa';
import Logo from '../images/logo2.png';
import './Navbar.css';
import { Link } from 'react-router-dom';

const Navbar = () => {
  const [click, setClick] = useState(false);
  const handleClick = () => setClick(!click);

  return (
    <div className='navbar'>
      <div className='logo'>
        <img src={Logo} alt='logo' />
      </div>
      <ul className={click ? 'nav-menu active' : 'nav-menu'}>
        <li className='nav-item'><Link to='/'>Home</Link></li>
        <li className='nav-item'><Link to='/about'>About</Link></li>
        <li className='nav-item'><Link to='/faq'>FAQ</Link></li>
        <li className='nav-item'><Link to='/contact'>Contact</Link></li>
      </ul>
      <div className='hamburger' onClick={handleClick}>
        {click ? (
          <FaTimes size={30} style={{ color: '#f8f8f8' }} />
        ) : (
          <FaBars size={30} style={{ color: '#f8f8f8' }} />
        )}
      </div>
    </div>
  );
};

export default Navbar;