import route from "riot-route";

import "./tags/parts/lv1-tab.tag";
import "./tags/pages/cat1/index.tag";
import "./tags/pages/cat2/index.tag";

<app>
  <header class="hero is-primary">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">Riotのサンプル</h1>
      </div>
    </div>
  </header>

  <lv1-tab tabs= { tabs } active={ activeTab } />
  <article id="cate-page"></article>

  <script>
    this.tabs = [
      { caption: "cat1", link: "#/cat1/1" },
      { caption: "cat2", link: "#/cat2/1" },
    ];

    this.route = route.create();
    this.route("/cat1/*", ()=>{
      riot.mount("#cate-page", "cat1-page");
      this.update({ activeTab: "cat1" });
    });
    this.route("/cat2/*", ()=>{
      riot.mount("#cate-page", "cat2-page");
      this.update({ activeTab: "cat2" });
    });

    route.start(true);

    this.on("unmount", ()=>{
      this.route.stop();
    });
  </script>
</app>

riot.mount("app");