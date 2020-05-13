import 'package:app/app.dart' as app;
import 'package:github_actions_toolkit/github_actions_toolkit.dart' as gaction;

/// This script will run at the start of a job,
/// before the `main.dart` action begins.
///
/// For example, you can run a prerequisite setup script.
///
/// Note that the step context is unavailable, as no steps have run yet.
void main(List<String> arguments) async {
  gaction.log.info('This is a setup script!');

  // This value will be shared with the main script and the cleanup script
  gaction.saveState('startTime', app.getTime().toString());
}
