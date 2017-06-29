import '../stagehand.dart';
import '../src/common.dart';
import 'server_aqueduct_simple_data.dart';

/**
 * A generator for a simple Aqueduct application.
 */
class ServerAqueductSimpleGenerator extends DefaultGenerator {
  ServerAqueductSimpleGenerator()
      : super('server-aqueduct-simple', 'Web Server',
      'A simple web server built using the aqueduct package.',
      categories: const ['dart', 'aqueduct', 'server']) {
    for (TemplateFile file in decodeConcatenatedData(data)) {
      addTemplateFile(file);
    }

    setEntrypoint(getFile('bin/main.dart'));
  }

  String getInstallInstructions() => "${super.getInstallInstructions()}\n"
      "run your app via 'dart ${entrypoint.path}'";
}
