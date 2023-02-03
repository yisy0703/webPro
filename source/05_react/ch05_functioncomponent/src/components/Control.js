import './Control.css';
const Control = props => {
  return (
    <ul className="Control">
      <li>
        <button onClick={()=>{
          props.onChangeMode('create');
        }}>
          create
        </button>
      </li>
      <li>
        <button onClick={()=>{
          props.onChangeMode('update');
        }}>
          update
        </button>
      </li>
      <li>
        <button  onClick={()=>{
          props.onChangeMode('delete');
        }}>
          delete
        </button>
      </li>
    </ul>
  );
};
export default Control;