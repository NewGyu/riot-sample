const loginPageOb = riot.observable();

<login-page>
  <header class="hero">
    <div class="hero-body">
      <h1 class="title">ログイン画面</h1>
    </div>
  </header>

  <div class="section">
    <div class="field">
      <label class="label">ユーザーID</label>
      <p class="control has-icon">
        <input class="input" type="text" ref="username" name="username" required=true placeholder="IDを入力">
        <span class="icon is-small"><i class="fa fa-user"></i></span>
      </p>
    </div>
    <div class="field">
      <label class="label">ログインパスワード</label>
      <p class="control has-icon">
        <input class="input" type="password" ref="password" name="password" placeholder="パスワードを入力">
        <span class="icon is-small"><i class="fa fa-lock"></i></span>
      </p>
    </div>
    <login-error></login-error>
  </div>

  <footer class="footer">
    <div class="container">
      <button class="button is-primary is-large" onclick={ doLogin } >ログインする</button>
    </div>
  </footer>

  <style type="scss">
    .button {
      width: 100%;
    }
  </style>

  <script>
    import ob from "obseriot";
    import { LoginAction, LoginSuccessed, LoginFailed } from "../../lib/action";

    ob.listen(LoginSuccessed, (r) => {
      loginPageOb.trigger("error-off");
    });

    ob.listen(LoginFailed, () => {
      riot.mount("login-error", "login-error-notification");
    });

    doLogin() {
      const authDetail = {
        username: this.refs.username.value,
        password: this.refs.password.value
      };
      ob.notify(LoginAction, authDetail);
    }

  </script>
</login-page>


<login-error-notification>
  <div class="notification is-danger">
    IDもしくはパスワードが間違っています。    
  </div>

  <script>
    loginPageOb.on("error-off", ()=>{
      this.unmount(true);
    });
  </script>
</login-error-notification>