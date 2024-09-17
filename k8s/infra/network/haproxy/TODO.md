- [ ] proxy for authorization instead of direct backend reference

```yaml
. . .
   http-request lua.auth-intercept be_auth_request /api/authz/forward-auth HEAD * authorization,proxy-authorization,remote-user,remote-groups,remote-name,remote-email - if protected-frontends
. . . 
backend be_auth_request
    server proxy 127.0.0.1:8085

listen be_auth_request_proxy
    bind 127.0.0.1:8085
    server authelia-backend authelia-backend:9091 resolvers docker ssl verify none
```

