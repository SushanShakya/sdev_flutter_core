[sdev_flutter_core] is a package for all the boilerplate code
necessary when developing a flutter application.

## Features

> Adapter interface
> Common extensions for Date, Time, String
> Navigation Utils
> Responsiveness Utils
> Storage Utils
> Validator

## Getting started

Install the package as a dependency to start using it in your flutter app

## Usage

### Date Extensions

```dart
final date = DateTime.now();
print(date.stringify);
```

### String Extensions

```dart
"Message".showBottomSnackBar(context);
```

### Time Extensions

```dart
final time = TimeOfDay.now();
time.stringify;
```

### Storing data easily via Storage classes

#### Storing data to file

```dart
class Profile implements Serializable {
    final String name;

    Profile({required this.name});

    @override
    Map<String, dynamic> toMap() {
        return {
            "name": name,
        };
    }
}
```

```dart
class ProfileAdapter implements IAdapter<Profile, Map<String, dynamic>> {
  @override
  Profile convert(Map<String, dynamic> data) {
    return Profile(name: data['name']);
  }
}
```

```dart
class ProfileStoreRepo extends FileStoreRepo<Profile> {
  ProfileStoreRepo({
    super.filename = "profile.txt",
  }) : super(adapter: ProfileAdapter());
}
```

```dart
final storeRepo = ProfileStoreRepo();
final Profile p = await network.fetchProfile();
await storeRepo.save(p);
```

```dart
final storeRepo = ProfileStoreRepo();
final savedProfile = await storeRepo.fetch();
if(savedProfile == null) {
    print("No saved Profile Found");
}
```

#### Storing data to Shared Preferences

```dart

class Token implements Serializable {
  final String accessToken;
  Token({
    required this.accessToken,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "access_token": accessToken,
    };
  }
}

class TokenAdapter implements IAdapter<Token, Map<String, dynamic>> {
  @override
  Token convert(Map<String, dynamic> data) {
    return Token(accessToken: data['access_token']);
  }
}

class TokenStoreRepo extends PrefsStoreRepo<Token> {
  TokenStoreRepo({
    required super.prefs,
    super.key = "@token",
  }) : super(adapter: TokenAdapter());
}

```


```dart
final storeRepo = TokenStoreRepo();
final Token p = await network.login(email, password);
await storeRepo.save(p);
```

```dart
final storeRepo = TokenStoreRepo();
final savedToken = await storeRepo.fetch();
if(savedProfile == null) {
    print("No saved Token Found");
}
```

### Using validators

```dart
TextFormField(
    validator: Validator.validateEmpty,
)
```


## Additional information