import 'package:app/app.dart' as app;
import 'package:github_actions_toolkit/github_actions_toolkit.dart' as gaction;

/// This script will run at the end of a job,
/// once the `main.dart` action has completed.
///
/// For example, you can use it to terminate certain processes or remove unneeded files.
void main(List<String> arguments) async {
  const logger = gaction.log;
  logger.info('This is a cleanup script!');

  // This value was set by the setup script.
  // It is null if this script wasn't executed.
  final startHour = gaction.getState('startTime');
  if (startHour != null) {
    final elapsed = app.getTime().difference(app.getTime(startHour)).inSeconds;
    logger.info('The setup script has been executed around $startHour'
        ', ie $elapsed seconds ago');
  }
}
