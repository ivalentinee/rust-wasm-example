import init, { custom_sum } from '/hello_rust_wasm.js';
init().then(() => {
  console.log('custom sum of 3 and 5:', custom_sum(3, 5));
});
