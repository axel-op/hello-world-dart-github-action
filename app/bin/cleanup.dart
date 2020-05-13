import 'package:github_actions_toolkit/github_actions_toolkit.dart' as gaction;

/// This script will run at the end of a job,
/// once the `main.dart` action has completed.
///
/// For example, you can use it to terminate certain processes or remove unneeded files.
void main(List<String> arguments) async {
  gaction.log.info('This is a cleanup script!');
}
