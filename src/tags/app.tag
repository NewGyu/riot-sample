import  "./authorized.tag";
import  "./unauthorized.tag";

<app>
  <article id="main"></article>
  <script>
    import route from "riot-route";
    import ob from "obseriot";
    import { AuthStore } from "../lib/store";
    import * as Action from "../lib/action";

    this.on("mount", () => {
      if(AuthStore.isLoggedIn()) {
        riot.mount("#main", "authorized-app");
      } else {
        riot.mount("#main", "unauthorized-app");
        route("/login");
      }
    });

    ob.listen(Action.LoginSuccessed, ()=> {
      riot.mount("#main", "authorized-app");
      route("/page1");
    });

    ob.listen(Action.LogoutAction, ()=> {
      riot.mount("#main", "unauthorized-app");
      route("/logout");
    })
  </script>
</app>

