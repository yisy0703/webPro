import './Subject.css';
const Subject = props => {
  // props.title = '수정불가. ReadOnly';
  return (
    <header className="Subject">
      <h1>{props.title}</h1>
      {props.sub}
    </header>
  );
};
export default Subject;