all: prices render

tokens = tmp/ETH.json tmp/LTC.json tmp/BTC.json \
	tmp/GBP.json tmp/USD.json tmp/CNY.json

prices: tmp
	$(MAKE) -j $(shell nproc) $(tokens)

tmp:
	mkdir -p $@

period = minute
url = "https://min-api.cryptocompare.com/data/histo$(period)?extraParams=turpin.dev"

# Fetch prices for a token
tmp/%.json:
	curl --silent "$(url)&fsym=$(basename $(notdir $@))&tsym=EUR&limit=1999" > $@

render: tmp prices
	./rendeR

clean:
	rm -rf tmp
