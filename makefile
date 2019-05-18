all: tmp ETH.json BCH.json XRP.json LTC.json ETC.json EOS.json \
	REP.json ZRX.json BTC.json BCHABC.json XLM.json

tmp:
	mkdir -p $@

target = USD
tokens = BTC ETH LTC
url = "https://min-api.cryptocompare.com/data/histohour"

# Fetch prices for a token
%.json:
	curl "$(url)?fsym=$(basename $@)&tsym=$(target)&limit=1999" > tmp/$@


