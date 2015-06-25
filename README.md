# wercker-step-npm-private-registry

> Changes the registry to a private registry

## Usage

The following step will put the version in the `PACKAGE_VERSION` environment variable.

```
- samverschueren/npm-private-registry:
	host: http://registry.company.com
```

If you have to sign in, provide the credentials for the user.

```
- samverschueren/npm-private-registry:
	host: http://registry.company.com
	username: myUsername
	password: myPassword
	email: myEmail
```

## Author

- Sam Verschueren [<sam.verschueren@gmail.com>]

## License

MIT © Sam Verschueren
