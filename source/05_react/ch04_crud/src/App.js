import './App.css';
import React, {Component} from 'react';
import Subject from './components/Subject';
import TOC from './components/TOC';
import ReadContent from './components/ReadContent';
import Control from './components/Control';
import CreateContent from './components/CreateContent';

class App extends Component{
  constructor(props){
    super(props);
    this.max_content_id = 3;
    this.state = {
      mode : 'welcome',
      selected_content_id : 1,
      subject : {title:'WEB', sub:'World wide web!'},
      contents : [
        {id:1, title:'HTML', desc:'HTML is HyperText Markup Langauge.'},
        {id:2, title:'CSS', desc:'CSS is for design'},
        {id:3, title:'JavaScript', desc:'JavaScript is for interacitive'},
      ],
      welcome : {title:'WELCOME', desc:'Hello, React!!!'},
    };
  } // 생성자

  getReadContent(){ // this.state.selected_content_id가 id인 contents안의 객체를 return
    for(var idx=0 ; idx<this.state.contents.length ; idx++){
      var data = this.state.contents[idx];
      if(data.id === this.state.selected_content_id){
        return data;
      } // if
    } // for
  } // getReacContent()

  getContent(){
    var _title, _desc, _article = null;
    if(this.state.mode === 'welcome'){
      _title = this.state.welcome.title;
      _desc = this.state.welcome.desc;
      _article = <ReadContent title={_title} desc={_desc}></ReadContent>
    }else if(this.state.mode === 'read'){
      var data = this.getReadContent();
      _article = <ReadContent title={data.title} desc={data.desc}></ReadContent>
    }else if(this.state.mode === 'create'){
      _article = <CreateContent></CreateContent>
    }else if(this.state.mode === 'update'){

    }// if(mode)
    return _article;
  } // getContent()

  render(){    
    return (
      <div>
        <Subject title={this.state.subject.title} 
                sub={this.state.subject.sub}
                onChangePage={function(){
                  this.setState({
                    mode : 'welcome',
                  });
                }.bind(this)}></Subject>
        <TOC data={this.state.contents} onChangePage={function(id){
          this.setState({
            mode : 'read',
            selected_content_id : Number(id),
          });
        }.bind(this)}></TOC>
        <Control onChangePage={function(_mode){
          //this.state.mode = _mode;
          this.setState({
            mode : _mode,
          });
        }.bind(this)}></Control>
        {this.getContent()}
      </div>
    );
  }
}

export default App;
