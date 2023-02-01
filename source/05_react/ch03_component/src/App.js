import './App.css';
import React, {Component} from 'react';
import Subject from './components/Subject';
import TOC from './components/TOC';
import Content from './components/Content';

class App extends Component{
  render(){
    return (
      <div>
        <Subject title="WEB" sub="World wide web!"></Subject> 
        <TOC></TOC>
        <Content title="HTML" desc="HTML is HyperText Markup Langauge."></Content>
      </div>
    );
  }
}

export default App;
