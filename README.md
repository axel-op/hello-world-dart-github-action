# Hello world Dart action

A "Hello World" GitHub Action coded in Dart.

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

The Dart application is located in the [`app`](./app) folder. The Javascript files under [`scripts`](scripts) are used to run it using the `dart` command.

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

## Example usage

```yaml
jobs:
  example:
    runs-on: ubuntu-latest

    container: google/dart:2

    steps:
      - uses: axel-op/hello-world-dart-action@master
        id: dart-action
        with:
          who-to-greet: "Mona the Octocat"
      - run: echo 'The time was ${{ steps.dart-action.outputs.time }}'
```
