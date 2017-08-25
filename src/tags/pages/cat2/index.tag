import route from "riot-route";

import "../../parts/lv2-tab.tag";
import "./page1.tag";
import "./page2.tag";

<cat2-page>
  <section class="section">
    <lv2-tab tabs={ tabs } active={ activeTab }/>
    <div class="box">
      <article id="page-content" />
    </div>
  </section>

  <style>
    .section {
      background-color: #eaf6ff;
    }
  </style>

  <script>
    this.tabs = [
      { caption: "page2-1", link: "#/cat2/1" },
      { caption: "page2-2", link: "#/cat2/2" },
    ];

    this.route = route.create();
    this.route("/cat2/1", ()=>{
      riot.mount("#page-content", "cat2-page1");
      this.update({ activeTab: "page2-1" });
    });
    this.route("/cat2/2", ()=>{
      riot.mount("#page-content", "cat2-page2");
      this.update({ activeTab: "page2-2" });
    });

    this.on("mount", ()=>{
      console.log("mount cat2");
    });
    this.on("unmount", ()=>{
      console.log("unmount cat2");
      this.route.stop();
    });
    
  </script>
</cat2-page>