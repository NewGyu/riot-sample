import route from "riot-route";

import "../../parts/lv2-tab.tag";
import "./page1.tag";
import "./page2.tag";
import "./page3.tag";

<cat1-page>
  <section class="section">
    <lv2-tab tabs={ tabs } active={ activeTab }/>
    <div class="box">
      <article id="page-content" />
    </div>
  </section>

  <style>
    .section {
      background-color: #fff8ea;
    }
  </style>

  <script>
    this.tabs = [
      { caption: "page1-1", link: "#/cat1/1" },
      { caption: "page1-2", link: "#/cat1/2" },
      { caption: "page1-3", link: "#/cat1/3" },
    ];

    this.route = route.create();
    this.route("/cat1/1", ()=>{
      riot.mount("#page-content", "cat1-page1");
      this.update({ activeTab: "page1-1" });
    });
    this.route("/cat1/2", ()=>{
      riot.mount("#page-content", "cat1-page2");
      this.update({ activeTab: "page1-2" });
    });
    this.route("/cat1/3", ()=>{
      riot.mount("#page-content", "cat1-page3");
      this.update({ activeTab: "page1-3" });
    });
  
    this.on("mount", ()=>{
      console.log("mount cat1");
    });
    this.on("unmount", ()=>{
      console.log("unmount cat1");
      this.route.stop();
    });

  </script>
</cat1-page>