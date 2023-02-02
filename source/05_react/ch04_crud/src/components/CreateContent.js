import { Component } from "react";

class CreateContent extends Component{
  render(){
    return(
      <article>
        <h2>CREATE</h2>
        <form action="/create_process" method="get" onSubmit={function(event){
            event.defaultPrevented();
            debugger;
            //this.props.onChangePage('title','desc');
        }.bind(this)}>
          <p><input type="text" name="title" placeholder="title"/></p>
          <p><textarea name="desc" placeholder="desc"></textarea></p>
          <p><input type="submit" value="추가"/></p>
        </form>
      </article>
    );
  }
}
export default CreateContent;