all: prices render

tokens = tmp/ETH.json tmp/BCH.json tmp/XRP.json tmp/LTC.json tmp/ETC.json \
	tmp/EOS.json tmp/REP.json tmp/ZRX.json tmp/BTC.json tmp/BCHABC.json \
	tmp/XLM.json tmp/ADA.json tmp/WAVES.json tmp/EOS.json tmp/XRP.json \
	tmp/ETC.json tmp/USDC.json tmp/BNB.json tmp/ATOM.json tmp/BAT.json

prices: tmp
	$(MAKE) -j $(shell nproc) $(tokens)

tmp:
	mkdir -p $@

url = "https://min-api.cryptocompare.com/data/histominute"

# Fetch prices for a token
tmp/%.json:
	curl --silent "$(url)?fsym=$(basename $(notdir $@))&tsym=USD&limit=1999" > $@

render: tmp prices
	./rendeR
