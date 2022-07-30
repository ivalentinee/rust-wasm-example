.PHONY: all wasm
all: .wasm .nodejs .browser

.wasm:
	cargo build --release --target wasm32-unknown-unknown

.nodejs:
	wasm-bindgen --typescript --target nodejs target/wasm32-unknown-unknown/release/hello_rust_wasm.wasm --out-dir target/wasm32-unknown-unknown/release/
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm_bg.wasm out/nodejs/hello_rust_wasm_bg.wasm
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm.js out/nodejs/hello_rust_wasm.cjs
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm.d.ts out/browser/hello_rust_wasm.d.js
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm_bg.wasm.d.ts out/browser/hello_rust_wasm_bg.wasm.d.ts

.browser:
	wasm-bindgen --typescript --target web target/wasm32-unknown-unknown/release/hello_rust_wasm.wasm --out-dir target/wasm32-unknown-unknown/release/
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm_bg.wasm out/browser/hello_rust_wasm_bg.wasm
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm.js out/browser/hello_rust_wasm.js
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm.d.ts out/browser/hello_rust_wasm.d.js
	cp -f target/wasm32-unknown-unknown/release/hello_rust_wasm_bg.wasm.d.ts out/browser/hello_rust_wasm_bg.wasm.d.ts
