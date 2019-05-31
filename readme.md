[![Build Status](https://travis-ci.org/deanturpin/tradeR.svg?branch=master)](https://travis-ci.org/deanturpin/tradeR)

See [recent analysis](https://deanturpin.github.io/tradeR/).

- Uses the [CryptoCompare API](https://min-api.cryptocompare.com/) for market
  prices
- Price data fetched in parallel using ```make```
- Analysis in R/Rmarkdown
- Served by nginx

# Web server
```bash
git clone --depth=1 https://github.com/deanturpin/tradeR /usr/share/nginx/html/tradeR
```
