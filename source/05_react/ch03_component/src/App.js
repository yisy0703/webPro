import './App.css';
import React, {Component} from 'react';

class App extends Component{
  render(){
    return (
      <div>
        <header>
          <h1>WEB</h1>
          World wide web!
        </header>
        <nav>
          <ul>
            <li><a href="1.html">HTML</a></li>
            <li><a href="2.html">CSS</a></li>
            <li><a href="3.html">JavaScript</a></li>
          </ul>
        </nav>
        <article>
          <h2>HTML</h2>
          HTML is HyperText Markup Langauge.
        </article>
      </div>
    );
  }
}


export default App;
