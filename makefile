all: prices render

tokens = tmp/ETH.json tmp/REP.json tmp/LTC.json tmp/BTC.json \
	tmp/GBP.json tmp/EUR.json tmp/CNY.json tmp/NOK.json

prices: tmp
	$(MAKE) -j $(shell nproc) $(tokens)

tmp:
	mkdir -p $@

period = minute
url = "https://min-api.cryptocompare.com/data/histo$(period)?extraParams=turpin.dev"

# Fetch prices for a token
tmp/%.json:
	curl --silent "$(url)&fsym=$(basename $(notdir $@))&tsym=USD&limit=1999" > $@

render: tmp prices
	./rendeR
