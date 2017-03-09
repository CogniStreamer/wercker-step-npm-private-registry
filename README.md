# wercker-step-npm-private-registry

> Changes the registry to a private registry.

## Usage

Sets the npm-registry to `http://registry.company.com`.

```
- samverschueren/npm-private-registry:
    host: http://registry.mycompany.com
```

If you have to sign in, provide the credentials for the user.

```
- samverschueren/npm-private-registry:
    host: http://registry.mycompany.com
    auth_token: myAuthToken
```

If you also have to use a scope, provide the scope as an additional property:

```
- samverschueren/npm-private-registry:
    host: http://registry.mycompany.com
    auth_token: myAuthToken
    scope: myScope
```

The auth token can be found in the `~/.npmrc` file after signing in at the private repository.

## Author

- Sam Verschueren [<sam.verschueren@gmail.com>]

## License

MIT © Sam Verschueren
