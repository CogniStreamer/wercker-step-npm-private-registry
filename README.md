# wercker-step-npm-private-registry

> Changes the registry to a private registry

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
	username: myUsername
	password: myPassword
	email: myEmail
```

## Author

- Sam Verschueren [<sam.verschueren@gmail.com>]

## License

MIT © Sam Verschueren
