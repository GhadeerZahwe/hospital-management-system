import React, { useState } from 'react';

const Login = () => {
  const [formData, setFormData] = useState({
    email: '',
    password: '',
  });

  const [status, setStatus] = useState(null);
  const [message, setMessage] = useState('');

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('login.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      const result = await response.json();

      setStatus(result.status);
      setMessage(result.message);

      if (result.status === 'success') {
        // Redirect or perform additional actions upon successful login
        console.log('User logged in:', result);
      }
    } catch (error) {
      console.error('Error during login:', error.message);
    }
  };

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  return (
    <div>
      <h2>User Login</h2>
      <form onSubmit={handleLogin}>
        <label>
          Email:
          <input type="email" name="email" onChange={handleChange} required />
        </label>
        <br />

        <label>
          Password:
          <input type="password" name="password" onChange={handleChange} required />
        </label>
        <br />

        <button type="submit">Login</button>
      </form>

      {status && (
        <div>
          <p>Status: {status}</p>
          <p>{message}</p>
        </div>
      )}
    </div>
  );
};

export default Login;
