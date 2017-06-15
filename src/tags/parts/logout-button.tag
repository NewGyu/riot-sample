<logout-button>
      <span class="icon is-large" onclick={ logout }>
        <i class="fa fa-sign-out"></i>
      </span>

    <script>
      import route from "riot-route";
      import ob from "obseriot";
      import * as Action from "../../lib/action";

      logout() {
        ob.notify(Action.LogoutAction);
      }
    </script>
</logout-button>