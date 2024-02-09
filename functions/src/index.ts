import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// firebase-adminの初期化
admin.initializeApp();

exports.deleteUser = functions
    .region("asia-northeast1")
    .firestore.document("delete_users/{docId}")
    .onCreate(async (snap) => {
        const deleteDocument = snap.data();
        const uid = deleteDocument?.uid;

        if (uid) {
            // Authenticationのユーザーを削除する
            await admin.auth().deleteUser(uid);
        } else {
            console.error("UID not found in the document data.");
        }
    });
