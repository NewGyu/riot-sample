import route from "riot-route";
import "./tags/pages/page1.tag";
import "./tags/pages/page2.tag";

<app>
  <header class="hero is-primary">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">Riotのサンプル</h1>
        <h2 class="subtitle">{ subtitle }</h2>
      </div>
    </div>
  </header>

  <nav class="tabs is-boxed">
    <ul>
      <li class="{ activePage == "page1" ? "is-active" : "" }">
        <a href="#/page1">
          <span class="icon is-small"><i class="fa fa-image"></i></span>
          <span>page1</span>
        </a>
      </li>
      <li class="{ activePage == "page2" ? "is-active" : "" }">
        <a href="#/page2">
          <span class="icon is-small"><i class="fa fa-music"></i></span>
          <span>page2</span>
        </a>
      </li>
    </ul>
  </nav>

  <article class="section">
    <page class="container"></page>
  </article>

  <script>
    route("/page1", () => {
      this.activePage = "page1";
      this.subtitle = "絵のページ";
      this.update();
      riot.mount("page", "page1");
    });
    route("/page2", () => {
      this.activePage = "page2";
      this.subtitle = "音楽のページ";
      this.update();
      riot.mount("page", "page2");
    });
    route(() => {
      route("/page1");
    });
    route.start(true);
  </script>
</app>

riot.mount("app");