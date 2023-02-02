import './App.css';
import React, {Component} from 'react';
import Subject from './components/Subject';
import TOC from './components/TOC';
import ReadContent from './components/ReadContent';
import Control from './components/Control';
import CreateContent from './components/CreateContent';
import UpdateContent from './components/UpdateContent';

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
      _article = <CreateContent onChangePage={function(_title, _desc){
        // this.state.contents에 {id:max_content_id+1, title:_title, desc:_desc}를 push
        this.max_content_id ++;
        // this.state.contents.push( // state의 값을 변경하려면 setState()함수 이용
        //   {id:this.max_content_id, title:_title, desc:_desc}
        // );
        // 1방법
        //var _contents = [ ... this.state.contents]; // 깊은 복사
        //_contents.push({id:this.max_content_id, title:_title, desc:_desc});
        // 2방법
        // var _contents = this.state.contents.concat(
        //                   {id:this.max_content_id, title:_title, desc:_desc}
        //                 );
        // 3방법
        var _contents = Array.from(this.state.contents); // 깊은 복사
        _contents.push({id:this.max_content_id, title:_title, desc:_desc});
        this.setState({
          contents : _contents,
          selected_content_id : this.max_content_id,
        });
      }.bind(this)}></CreateContent>
    }else if(this.state.mode === 'update'){
      // 데이터가 없어서 selected_content_id가 0일 경우 welcome모드로
      if(this.state.selected_content_id === 0){
        alert('데이터가 존재하지 않습니다');
        this.setState({
          mode : 'welcome',
        });
        return;
      } // 처음엔 이부분 빼자
      var _content = this.getReadContent();
      _article = <UpdateContent data={_content} onChangePage={function(_id, _title, _desc){
        // id가 _id인 contents안의 객체값을 교체 ({id:_id, title:_title, desc:_desc})
        var _contents = Array.from(this.state.contents);
        for(var idx=0 ; idx<_contents.length ; idx++){
          if(_contents[idx].id === _id){
            //_contents[idx] = {id:_id, title:_title, desc:_desc};
            _contents[idx].title = _title;
            _contents[idx].desc = _desc;
            break;
          } // if
        }//for - _contents 교체완료
        this.setState({
          contents : _contents,
          mode : 'read',
        });
        // mode를 read로
      }.bind(this)}></UpdateContent>
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
          if(_mode === 'delete'){
            if(window.confirm('삭제하시면 복구 불가합니다. 삭제 진행할까요?')){
              // this.state.selected_content_id가 id인 contents안의 객체를 제거
              var _contents = Array.from(this.state.contents);
              for(var idx=0 ; idx<_contents.length ; idx++){
                if(_contents[idx].id === this.state.selected_content_id){
                  _contents.splice(idx, 1); //  idx번째 1개 제거
                  // this.state.selected_content_id를 다른 id로 하기 위한 정렬 작업
                  var first; // id를 기준으로 오름차순 정렬후 첫번째 객체의 id
                  if(_contents.length>0){
                    first = Array.from(_contents).sort(function(left, right){
                              return left.id - right.id; // 오름차순 정렬
                            }).slice(0,1)[0].id;
                  }else{
                    first = 0;
                  } // if
                  // mode를 welcome나 read
                  // this.state.selected_content_id를 다른 id로 
                  this.setState({
                    contents : _contents,
                    mode : 'welcome',
                    selected_content_id : first,
                  });
                  break;
                }//if
              }//for              
            }//if (confirm)
          }else{
            this.setState({
              mode : _mode,
            });
          }
        }.bind(this)}></Control>
        {this.getContent()}
      </div>
    );
  }
}

export default App;
