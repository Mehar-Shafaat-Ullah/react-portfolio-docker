// Disable Firebase completely for now

// export const auth = getAuth();
// const provider = new GoogleAuthProvider();
// export const db = getFirestore(app);
// export const storage = getStorage(app);
// export const signInWithGoogle = () => signInWithPopup(auth, provider);

export const auth = null;
export const db = null;
export const storage = null;
export const signInWithGoogle = () => {
  console.warn("Firebase disabled in this environment");
};

