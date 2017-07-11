export function* generatorFunc() {
  yield waitFor(2);
  return "generator";
}

export async function asyncFunc() {
  await waitFor(3);
  return "async";
}

function waitFor(sec) {
  return new Promise((res, rej) => {
    setTimeout(res, 1000*sec);
  });
}