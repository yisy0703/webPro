import React, {Component} from 'react';
import './Subject.css';
class Subject extends Component{
  render(){
    return (
      <header className='subject_h'>
        <h1>{this.props.title}</h1>
        {this.props.sub}
      </header>
    );
  }
}
export default Subject;