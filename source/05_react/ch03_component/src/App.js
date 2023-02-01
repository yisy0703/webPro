import './App.css';
import React, {Component} from 'react';
import Subject from './components/Subject';
import TOC from './components/TOC';
import Content from './components/Content';

class App extends Component{
  constructor(props){
    super(props);
    this.state = {
      subject : {title:'WEB', sub:'World wide web!'},
      contents : [
        {id:1, title:'HTML', desc:'HTML is HyperText Markup Langauge.'},
        {id:2, title:'CSS', desc:'CSS is for design'},
        {id:3, title:'JavaScript', desc:'JavaScript is for interacitive'},
      ],
      welcome : {title:'WELCOME', desc:'Hello, React!!!'},
    };
  }
  render(){
    return (
      <div>
        <Subject title={this.state.subject.title} 
                sub={this.state.subject.sub}></Subject> 
        <TOC data={this.state.contents}></TOC>
        <Content title={this.state.welcome.title} 
                desc={this.state.welcome.desc}></Content>
      </div>
    );
  }
}

export default App;
