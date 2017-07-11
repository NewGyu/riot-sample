import { generatorFunc, asyncFunc } from "../../lib";
import co from "co";

<async-page>
  <button class="button { is-loading: yielding }" onclick={ testGeneratorYield }>generator,yield</button>
  <button class="button { is-loading: awaiting }" onclick={ testAsyncAwait }>async,await</button>

  <div id="notify-area"></div>

  <script>

  async testAsyncAwait(e) {
    this.update({awaiting: true});
    const r = await asyncFunc();
    riot.mount("#notify-area", "message-notify", {text: r});
    this.update({awaiting: false});
  }

  testGeneratorYield(e) {
    const self = this;
    co(function*(){
      self.update({yielding: true});
      const r = yield generatorFunc();
      riot.mount("#notify-area", "message-notify", {text: r});
      self.update({yielding: false});
    })
  }

  </script>
</async-page>

<message-notify>
  <div class="notification">
    <button class="delete" onclick={ closeMe }></button>
    <p>{ opts.text }</p>
  </div>

  <script>
    closeMe() {
      this.unmount(true);
    }
  </script>
</message-notify>