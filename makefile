all: tmp prices

tokens = tmp/ETH.json tmp/BCH.json tmp/XRP.json tmp/LTC.json tmp/ETC.json \
	tmp/EOS.json tmp/REP.json tmp/ZRX.json tmp/BTC.json tmp/BCHABC.json \
	tmp/XLM.json

prices: tmp
	$(MAKE) -j $(shell nproc) $(tokens)

tmp:
	mkdir -p $@

url = "https://min-api.cryptocompare.com/data/histominute"

# Fetch prices for a token
tmp/%.json:
	curl "$(url)?fsym=$(basename $(notdir $@))&tsym=USD&limit=1999" > $@
