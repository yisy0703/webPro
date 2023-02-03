const Subject = () => {
  return (
    <header>
      <h1>WEB</h1>
      World wide web!
    </header>
  );
};
const TOC = () => {
  return (
    <nav>
      <ol>
        <li><a href="1.html">HTML</a></li>
        <li><a href="2.html">CSS</a></li>
        <li><a href="3.html">JavaScript</a></li>
      </ol>
    </nav>
  );
};
const Control = () => {
  return (
    <ul class="Control">
      <li><button>create</button></li>
      <li><button>update</button></li>
      <li><button>delete</button></li>
    </ul>
  );
};
const ReadContent = () => {
  return (
    <article>
      <h2>HTML</h2>
      HTML is HyperText Markup Langauge.
    </article>
  );
};
function App() {
  return (
    <>
      <Subject></Subject>
      <TOC></TOC>
      <Control></Control>
      <ReadContent></ReadContent>
    </>
  );
}

export default App;
