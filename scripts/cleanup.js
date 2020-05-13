const core = require('@actions/core');
const exec = require('@actions/exec');
const path = require('path');

async function run() {
    try {
        // The folder containing the Dart files is named 'app'
        const appDir = path.join(__dirname, '..', 'app');

        // No need to re-download dependencies

        const execOptions = {
            cwd: appDir,
            ignoreReturnCode: true,
            silent: true,
            listeners: {
                stdout: (data) => process.stdout.write(data.toString()),
                stderr: (data) => process.stderr.write(data.toString())
            }
        };

        process.exitCode = await exec.exec('dart', ['bin/cleanup.dart'], execOptions);
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();