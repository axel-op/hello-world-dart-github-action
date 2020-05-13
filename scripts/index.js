const core = require('@actions/core');
const exec = require('@actions/exec');
const path = require('path');

async function run() {
    try {
        // The folder containing the Dart files is named 'app'
        const appDir = path.join(__dirname, '..', 'app');

        const execOptions = { cwd: appDir };

        await core.group('Getting dependencies', () => exec.exec('pub', ['get'], execOptions));

        execOptions.ignoreReturnCode = true;
        execOptions.silent = true;
        execOptions.listeners = {
            stdout: (data) => process.stdout.write(data.toString()),
            stderr: (data) => process.stderr.write(data.toString())
        };

        process.exitCode = await exec.exec('dart', ['bin/main.dart'], execOptions);
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();