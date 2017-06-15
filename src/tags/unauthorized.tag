import "./pages/login.tag";
import "./pages/logout.tag";

<unauthorized-app>
  <article id="login-page" />

  <script>
    import route from "riot-route";
    import ob from "obseriot";
    import * as Action from "../lib/action";

    const rt = route.create();
    rt("/login", ()=> {
      riot.mount("#login-page", "login-page");
    });
    rt("/logout", ()=> {
      riot.mount("#login-page","logout-page");
    });
  </script>
</unauthorized-app>
