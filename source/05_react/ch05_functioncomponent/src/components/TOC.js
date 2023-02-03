const TOC = props => {
  let lists = [];
  let data = props.data;
  for(let idx=0 ; idx<data.length ; idx++){
    lists.push(
      <li key={data[idx].id}>
        <a href={data[idx].id+'.html'} 
            id={data[idx].id}
            onClick={ event => {
              event.preventDefault();
              //console.log(event.target.id); //event.target:이벤트가 발생된 태그 객체
              //debugger;
              props.onChangeMode(Number(event.target.id));
            }}>
          {data[idx].title}
        </a>
      </li>
    );
  }//for
  // <li><a href="1.html">HTML</a></li>,
  return (
    <nav>
      <ol>
        {lists}
      </ol>
    </nav>
  );
};
export default TOC;