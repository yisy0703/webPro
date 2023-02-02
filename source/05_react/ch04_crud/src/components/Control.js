import { Component } from "react";
import './Control.css';
class Control extends Component{
  render(){
    return(
      <ul className="Control">
        <li>
          <button onClick={function(){
            this.props.onChangePage('create');
          }.bind(this)}>
            CREATE
          </button>
        </li>
        <li>
          <button onClick={function(){
              this.props.onChangePage('update');
          }.bind(this)}>
            UPDATE
          </button>
        </li>
        <li>
          <button onClick={function(){
              this.props.onChangePage('delete');
          }.bind(this)}>
            DELETE
          </button>
        </li>
      </ul>
    );
  }
}
export default Control;