import ob from "obseriot";
import * as Cognito from "../logic/cognito";

const debug = require("debug")("action:login");

export const LoginAction = {
  handler: {
    name: "login",
    action: authDetail => {
      debug("challenge authenticate...", authDetail);
      Cognito.authenticateUser(authDetail)
      .then(user => {
        ob.notify(LoginSuccessed, user)
      }).catch(err => {
        ob.notify(LoginFailed);
      })
    }
  }
}

export const LoginSuccessed = {
  handler: {
    name: "login.successed",
    action: user => {
      debug("successed", user);
      return user
    }
  }
}

export const LoginFailed = {
  handler: {
    name: "login.failed",
    action: err => {
      debug("failed", err);
      return err;
    }
  }
}

export const LogoutAction = {
  handler: {
    name: "logout.action",
    action: () => {
      const user = Cognito.currentUser();
      if(user) {
        user.signOut();
      }
      debug("logout");
    }
  }
}