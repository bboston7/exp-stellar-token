default: build

build:
	stellar contract build --out-dir opt/
	@ls -l opt/*.wasm

deploy: build
	stellar contract deploy --wasm opt/token.wasm --alias contract --source-account me --rpc-url https://soroban-testnet.stellar.org --network-passphrase "Test SDF Network ; September 2015" -- --admin=me --name="contract" --symbol="contract"

mint:
	stellar contract invoke --id contract -- mint --to me --amount 1000000000
