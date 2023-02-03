import Subject from './components/Subject';
import TOC from './components/TOC';
import Control from './components/Control';
import ReadContent from './components/ReadContent';

function App() {
  let contents = [
    {id:1, title:'HTML', body:'HTML is HyperText Markup Langauge.'},
    {id:2, title:'CSS', body:'CSS is for design.'},
    {id:3, title:'JavaScript', body:'JavaScript is for interactive.'}
  ];
  return (
    <>
      <Subject title="Web" sub="World wide web!"></Subject>
      <TOC data={contents}></TOC>
      <Control></Control>
      <ReadContent></ReadContent>
    </>
  );
}

export default App;
