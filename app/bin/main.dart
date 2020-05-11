import 'dart:io';

import 'package:app/app.dart' as app;
import 'package:github_actions_toolkit/github_actions_toolkit.dart' as gaction;

void main(List<String> arguments) {
  exitCode = 0;

  try {
    // `who-to-greet` input defined in action metadata file
    final nameToGreet = gaction.Input(
      'who-to-greet',
      isRequired: false,
      canBeEmpty: true,
    ).value;

    gaction.log.info('Hello $nameToGreet!');

    final time = app.getTime().toString();
    gaction.setOutput('time', time);

    // Get the JSON webhook payload for the event that triggered the workflow
    final payloadPath = Platform.environment['GITHUB_EVENT_PATH'];
    final payload = File(payloadPath).readAsStringSync();
    gaction.log.info('The event payload: $payload');
  } catch (error) {
    gaction.log.error(error.toString());
    exitCode = 1;
  }
}
