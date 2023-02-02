import React, {Component} from 'react';
import './Subject.css';
class Subject extends Component{
  render(){
    // this.props.title = 'React'; readOnly
    return (
      <header className='subject_h'>
        <h1><a href="/">{this.props.title}</a></h1>
        {this.props.sub}
      </header>
    );
  }
}
export default Subject;