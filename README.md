# Hello world Dart action

A "Hello World" GitHub Action coded in Dart.

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

The Dart application is located in the [`app`](./app) directory. To use this template, just edit the files inside this directory as you would with any Dart program, and it will work without modifiying any other file.

This action requires the workflow to set up a Dart container before its execution (see the example below). If you want your action to be run in any workflow, without this constraint, see [this template for a containerized Dart Action](https://github.com/axel-op/containerized-dart-action).

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
