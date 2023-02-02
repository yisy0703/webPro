import { Component } from "react";
import './Control.css';
class Control extends Component{
  render(){
    return(
      <ul className="Control">
        <li><button>CREATE</button></li>
        <li><button>UPDATE</button></li>
        <li><button>DELETE</button></li>
      </ul>
    );
  }
}
export default Control;