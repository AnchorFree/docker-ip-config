# bind9 recursive caching DNS server

current configuration expect bind to have `network_mode: host`
it is not really necessary to have a host networking, but if will you decid to change this, please don't forget to change following configuration:

```
listen-on { 127.0.0.1; };

allow-recursion {
    127.0.0.1/32;
};
```
