import Subject from './components/Subject';
import TOC from './components/TOC';
import Control from './components/Control';
import ReadContent from './components/ReadContent';

function App() {
  let mode = 'read';
  let maxId = 3; // 현재 contents(삭제되었을 수도 있는)의 가장 큰 id. create모드에서 사용
  let selectedId = 2;
  let contents = [
    {id:1, title:'HTML', body:'HTML is HyperText Markup Langauge.'},
    {id:2, title:'CSS', body:'CSS is for design.'},
    {id:3, title:'JavaScript', body:'JavaScript is for interactive.'}
  ];
  let subject = {title : 'WEB', sub:'World Wide Web!'};
  let welcome = {title:'WELCOME', body:'Hello, React!!! !!!'};
  let _title, _body, _article = null;
  if(mode === 'welcome'){
    _title = welcome.title;
    _body = welcome.body;
    _article = <ReadContent title={_title} body={_body}></ReadContent>
  }else if(mode === 'read'){
    _title = contents[0].title;
    _body = contents[0].body;
    _article = <ReadContent title={_title} body={_body}></ReadContent>
  }
  return (
    <>
      <Subject title={subject.title} sub={subject.sub}
              onChangeMode={()=>{
                mode = 'welcome';
              }}
      ></Subject>
      <TOC data={contents}></TOC>
      <Control></Control>
      <ReadContent title="CSS" body="CSS is for design."></ReadContent>
    </>
  );
}

export default App;
