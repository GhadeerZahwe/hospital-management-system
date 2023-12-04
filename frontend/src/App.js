// App.js
import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import HomePage from './components/HomePage';
import LoginPage from './components/Login';
import RegisterPage from './components/Register';
import AdminPortalPage from './pages/AdminPortalPage';
import PatientPortalPage from './pages/PatientPortalPage';

function App() {
  return (
    <Router>
      <Route path="/" exact component={HomePage} />
      <Route path="/login" component={LoginPage} />
      <Route path="/register" component={RegisterPage} />
      <Route path="/admin-portal" component={AdminPortalPage} />
      <Route path="/patient-portal" component={PatientPortalPage} />
    </Router>
  );
}

export default App;
