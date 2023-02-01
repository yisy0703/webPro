import React, {Component} from 'react';
class TOC extends Component{
  render(){
    var lists = [];
    // this.props.data를 받아 <li><a href="1.html">HTML</a></li> 형태의 배열로 lists 
    var data = this.props.data;
    for(var i=0 ; i < data.length ; i++){
      lists.push(
        <li key={data[i].id}>
          <a href={data[i].id+".html"}>
            {data[i].title}          
          </a>
        </li>
      );
    }
    return (
      <nav>
        <ul>
          {lists}
        </ul>
      </nav>
    );
  }
}
export default TOC;