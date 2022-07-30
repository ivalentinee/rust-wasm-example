.PHONY: all wasm
all: .wasm .nodejs .browser

.wasm:
	cargo build --release --target wasm32-unknown-unknown

.nodejs:
	wasm-bindgen --target nodejs target/wasm32-unknown-unknown/release/hello_rust_wasm.wasm --out-dir target/wasm32-unknown-unknown/release/
	cp target/wasm32-unknown-unknown/release/hello_rust_wasm_bg.wasm out/nodejs/hello_rust_wasm_bg.wasm
	cp target/wasm32-unknown-unknown/release/hello_rust_wasm.js out/nodejs/hello_rust_wasm.cjs

.browser:
	wasm-bindgen --target web target/wasm32-unknown-unknown/release/hello_rust_wasm.wasm --out-dir target/wasm32-unknown-unknown/release/
	cp target/wasm32-unknown-unknown/release/hello_rust_wasm_bg.wasm out/browser/hello_rust_wasm_bg.wasm
	cp target/wasm32-unknown-unknown/release/hello_rust_wasm.js out/browser/hello_rust_wasm.js
