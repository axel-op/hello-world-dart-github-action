const core = require('@actions/core');
const exec = require('@actions/exec');
const path = require('path');

async function run() {
  try {
    // The folder containing the Dart files is named 'app'
    const appDir = path.join(__dirname, './app');

    const execOptions = { cwd: appDir };

    await exec.exec('pub', ['get'], execOptions);

    execOptions.ignoreReturnCode = true;
    const exitCode = await exec.exec('dart', ['bin/main.dart'], execOptions);

    process.exitCode = exitCode;
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();