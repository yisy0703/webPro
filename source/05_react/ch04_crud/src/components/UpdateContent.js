import { Component } from "react";

class UpdateContent extends Component{
  render(){
    return(
      <article>
        <h2>UPDATE</h2>
        <form action="/create_process" method="get" onSubmit={function(event){
            event.preventDefault();
            this.props.onChangePage(
              event.target.title.value,
              event.target.desc.value
            );
            event.target.title.value = '';
            event.target.desc.value = '';
        }.bind(this)}>
          <p>
            <input type="text" name="title" placeholder="title" value={this.props.data.title}
              />
          </p>
          <p><textarea name="desc" placeholder="desc" value={this.props.data.desc}></textarea></p>
          <p><input type="submit" value="수정"/></p>
        </form>
      </article>
    );
  }
}
export default UpdateContent;