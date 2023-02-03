const TOC = props => {
  let lists = [];
  let data = props.data;
  for(let idx=0 ; idx<data.length ; idx++){
    lists.push(
      <li key={data[idx].id}>
        <a href={data[idx].id+'.html'} 
            data-id={data[idx].id}
            id={data[idx].id}>
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