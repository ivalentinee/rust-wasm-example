import * as wasmModule from './hello_rust_wasm.cjs';

console.log('custom sum of 3 and 5:', wasmModule.custom_sum(3, 5));
