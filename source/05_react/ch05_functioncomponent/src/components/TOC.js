const TOC = props => {
  let lists = [];
  let data = props.data;
  for(let idx=0 ; idx<data.length ; idx++){
    lists.push(
      <li>
        <a href={data[idx].id+'.html'}>
          {data[idx].title}
        </a>
      </li>
    );
  }//for
  return (
    <nav>
      <ol>
        {lists}
      </ol>
    </nav>
  );
};
export default TOC;