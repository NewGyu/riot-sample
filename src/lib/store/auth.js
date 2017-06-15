/** ログイン状態の管理ストア */
import ob from "obseriot";
import * as Cognito from "../logic/cognito";

const STATE_KEY="AuthStore.state";
const storage = window.localStorage;

export const AuthStore = new class AuthStore {
  constructor() {
    this.handler= {
      name: "store.Auth",
      action: () => this
    }
  }

  isLoggedIn() {
    return Cognito.currentUser() ? true : false;
  }

  get currentUser() {
    return Cognito.currentUser();
  }

}
