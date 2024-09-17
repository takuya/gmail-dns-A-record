## DNS A Record Collection

A-record in gmail.com is round-robin record.

To check connection in Firewall, we need IP addr.

## example

```shell
bash Collect_DNS_A_RECORD.sh imap.gmail.com 100
```

This willrun command 100 times with 10 sec interval.
```shell
dig @ns1.google.com "${DOMAIN_NAME}" +short
```

Results will appear in text file named `${DOMAIN_NAME}.txt`

## restrictions

Search NS of domain name is complex task .

so, I skip NS search,and just use the `@ns1.google.com` in every dns query.


