import 'dart:io';

import 'package:app/app.dart' as app;
import 'package:github_actions_toolkit/github_actions_toolkit.dart' as gaction;

void main(List<String> arguments) async {
  exitCode = 0;

  const logger = gaction.log;
  try {
    // `who-to-greet` input defined in `action.yml` file
    final nameToGreet = gaction.Input(
      'who-to-greet',
      isRequired: true,
      canBeEmpty: true,
    );

    logger.info('Hello ${nameToGreet.value}!');

    final time = app.getTime().toString();

    // This output is defined in the `action.yml` file
    // and can be used by the next steps in the workflow.
    gaction.setOutput('time', time);

    await logger.group('Event payload', () async {
      // Get the JSON webhook payload for the event that triggered the workflow
      final payload = gaction.env.eventPayload;
      // Uncomment the following line to log the event payload:
      // logger.info('The event payload: $payload');
    });
  } catch (error) {
    logger.error(error.toString());
    exitCode = 1;
  }
}
