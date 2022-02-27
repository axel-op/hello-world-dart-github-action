# Hello world Dart action

> [See here](https://gist.github.com/axel-op/deff66ac2f28a01813193d90de36c564) for a comparison of the different ways to build a GitHub Action with Dart.

A "Hello World" GitHub Action coded in Dart.

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

The Dart application is located in the [`app`](./app) directory. To use this template, just edit the files inside this directory as you would with any Dart program, and it will work without modifiying any other file.

This action requires the workflow to set up a Dart container before its execution (see the example below). [See here](https://github.com/axel-op/self-contained-dart-action) to build an action with Dart that doesn't need a Dart container to run.

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

    container: google/dart:2 # Required to run the action

    steps:
      - uses: axel-op/hello-world-dart-action@master
        id: dart-action
        with:
          who-to-greet: "Mona the Octocat"
      - run: echo 'The time was ${{ steps.dart-action.outputs.time }}'
```
