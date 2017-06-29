import '../stagehand.dart';
import '../src/common.dart';
import 'server_aqueduct_full_data.dart';

/**
 * A generator for a full Aqueduct application.
 */
class ServerAqueductFullGenerator extends DefaultGenerator {
  ServerAqueductFullGenerator()
      : super('server-aqueduct-full', 'Web Server',
      'A web server built using the aqueduct package.',
      categories: const ['dart', 'aqueduct', 'server']) {
    for (TemplateFile file in decodeConcatenatedData(data)) {
      addTemplateFile(file);
    }

    setEntrypoint(getFile('bin/main.dart'));
  }

  String getInstallInstructions() => "${super.getInstallInstructions()}\n"
      "run your app via 'dart ${entrypoint.path}'";
}
