import { CognitoIdentityCredentials } from "../aws";
import * as config from "config";
import { CognitoUserPool, AuthenticationDetails, CognitoUser } from "amazon-cognito-identity-js";
const userPool = new CognitoUserPool({
  UserPoolId: config.UserPool.PoolId,
  ClientId: config.UserPool.ClientId
});

export function currentUser() {
  return userPool.getCurrentUser();
}

/**
 * 
 * 
 * @export
 * @param {any} cognitoUser 
 * @returns {Promise<Session>}
 */
export function getSession(cognitoUser) {
  return new Promise((res, rej) => {
    cognitoUser.getSession((err, session) => {
      if (err) {
        return rej(err);
      }
      res(session);
    })
  });
}

/**
 * パスワードでユーザー認証をする
 * 
 * @export
 * @param {any} authDetail 
 * @param {string} authDetail.username 
 * @param {string} authDetail.password
 * @returns {Promise<CognitoUser>}
 */
export function authenticateUser(authDetail) {
  return new Promise((res, rej) => {
    const user = new CognitoUser({
      Pool: userPool,
      Username: authDetail.username
    });
    const detail = new AuthenticationDetails({
      Username: authDetail.username,
      Password: authDetail.password
    });
    const callbacks = {
      onSuccess: session => {
        res(user);
      },
      onFailure: err => {
        rej(err);
      },
      newPasswordRequired: (attrs, requiredAttrs) => {
        user.completeNewPasswordChallenge(authDetail.password, requiredAttrs, callbacks);
      }
    }
    user.authenticateUser(detail, callbacks);
  });
}

/**
 * CognitoUserのsessionからCredentialの作成
 * 
 * @export
 * @param {any} session 
 * @returns 
 */
export function getCognitoIdentityCredentials(session) {
  //Credentialsはキャッシュしたほうが良さ気  
  return new CognitoIdentityCredentials({
    IdentityPoolId: config.IdentityPool.PoolId,
    Logins: {
      [`cognito-idp.us-east-1.amazonaws.com/${config.UserPool.PoolId}`]: session.getIdToken().getJwtToken()
    }
  }, {
      region: "ap-northeast-1"
    });
}
