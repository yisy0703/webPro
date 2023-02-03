import Subject from './components/Subject';
import TOC from './components/TOC';
import Control from './components/Control';
import ReadContent from './components/ReadContent';
import React, {useState} from 'react';

function App() {
  // let mode = 'read';
  // const _mode = useState('read');
  // let mode = _mode[0];
  // let setMode = _mode[1];
  let [mode, setMode] = useState('read');
  let maxId = 3; // 현재 contents(삭제되었을 수도 있는)의 가장 큰 id. create모드에서 사용
  let [selectedId, setSelectedId] = useState(2);
  let [contents, setContents] = useState([
    {id:1, title:'HTML', body:'HTML is HyperText Markup Langauge.'},
    {id:2, title:'CSS', body:'CSS is for design.'},
    {id:3, title:'JavaScript', body:'JavaScript is for interactive.'}
  ]);
  let subject = {title : 'WEB', sub:'World Wide Web!'};
  let welcome = {title:'WELCOME', body:'Hello, React!!! !!!'};
  let _title, _body, _article = null;

  if(mode === 'welcome'){
    console.log(mode);
    _title = welcome.title;
    _body = welcome.body;
    _article = <ReadContent title={_title} body={_body}></ReadContent>
  }else if(mode === 'read'){
    
    for(var i=0 ; i<contents.length ; i++){
      if(contents[i].id === selectedId){
        _title = contents[i].title;
        _body = contents[i].body;
        break;
      }
    }
    _article = <ReadContent title={_title} body={_body}></ReadContent>
  }
  return (
    <>
      <Subject title={subject.title} sub={subject.sub}
              onChangeMode={()=>{
                //mode = 'welcome';
                setMode('welcome');
              }}
      ></Subject>
      <TOC data={contents} onChangeMode={(_id)=>{
        //selectedId = _id;
        setSelectedId(_id);
        setMode('read');
      }}></TOC>
      <Control></Control>
      {_article}
    </>
  );
}

export default App;
