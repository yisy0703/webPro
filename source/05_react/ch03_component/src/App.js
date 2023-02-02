import './App.css';
import React, {Component} from 'react';
//import Subject from './components/Subject';
import TOC from './components/TOC';
import ReadContent from './components/ReadContent';

class App extends Component{
  constructor(props){
    super(props);
    this.state = {
      mode : 'read',
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
    var _title, _desc = null;
    if(this.state.mode === 'welcome'){
      _title = this.state.welcome.title;
      _desc = this.state.welcome.desc;
    }else if(this.state.mode === 'read'){
      _title = this.state.contents[0].title;
      _desc = this.state.contents[0].desc;
    }
    return (
      <div>
        {/* <Subject title={this.state.subject.title} 
                sub={this.state.subject.sub}></Subject>  */}
        <header className='subject_h'>
          <h1>
            <a href="/" onClick={function(event){
                event.preventDefault(); // a 태그의 기본 event기능을 막음
                //this.state.mode = 'welcome'; state값은 바로 변경해도 화면에 반영 안 함
                this.setState({
                  mode : 'welcome',
                });
            }.bind(this)}>
              {this.state.subject.title}
            </a>
          </h1>
          {this.state.subject.sub}
        </header>
        <TOC data={this.state.contents}></TOC>
        <ReadContent title={_title} 
                desc={_desc}></ReadContent>
      </div>
    );
  }
}

export default App;
