import "./parts/logout-button.tag";
import "./parts/menu-button.tag";
import "./pages/page1.tag";
import "./pages/page2.tag";

<authorized-app>
  <header class="hero is-primary">
    <nav class="nav">
      <div class="nav-left">
        <menu-button></menu-button>
      </div>
      <div class="nag-right">
        <logout-button></logout-button>
      </div>
    </nav>
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
    import route from "riot-route";
    const rt = route.create();
    rt("/page1", () => {
      this.activePage = "page1";
      this.subtitle = "絵のページ";
      this.update();
      riot.mount("page", "page1");
    });
    rt("/page2", () => {
      this.activePage = "page2";
      this.subtitle = "音楽のページ";
      this.update();
      riot.mount("page", "page2");
    });
  </script>
</authorized-app>

