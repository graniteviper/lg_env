import 'package:flutter/material.dart';
import 'connection_screen.dart';
import '../kml/iss_kml.dart';
import '../services/iss_service.dart';
import 'settings_screen.dart';
import 'package:provider/provider.dart'; // Imports the library provider.dart (which contains tools to manage the app state)
import '../services/lg_service.dart'; // Imports the LG service screen, which handles the logic to connect to the Liquid Galaxy screen
import 'package:flutter/services.dart' show rootBundle;

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Future<void> _sendHomeKml(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);
    final connected = await lgService.connectToLG();

    if (!context.mounted) return;

    if (connected != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not connect with the Liquid Galaxy'),
        ),
      );
      return;
    }

    String sampleKml;
    try {
      sampleKml = await rootBundle.loadString('assets/kml/sendKmlExample.kml');
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('There was an error loading the KML file: $e')),
      );
      return;
    }

    await lgService.uploadKml(sampleKml, 'example.kml');
    await Future.delayed(const Duration(seconds: 1));
    lgService.forceRefresh(1);
    await lgService.flyTo(
      '<LookAt><longitude>77.380581</longitude><latitude>28.665771</latitude><altitude>0</altitude><heading>0</heading><tilt>45</tilt><range>2000</range><altitudeMode>relativeToGround</altitudeMode></LookAt>',
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('A visit to my Hometown!!')));
  }

  Future<void> _sendLogo(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);
    final connected = await lgService.connectToLG();

    if (!context.mounted) return;

    if (connected != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not connect with the Liquid Galaxy'),
        ),
      );
      return;
    }

    await lgService.sendLogo();
    await Future.delayed(const Duration(seconds: 1));
    lgService.forceRefresh(1);

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logo sent successfully!!')));
  }

  Future<void> _cleanKml(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);
    final connected = await lgService.connectToLG();

    if (!context.mounted) return;

    if (connected != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not connect with the Liquid Galaxy'),
        ),
      );
      return;
    }
    await lgService.cleanKML();
    await Future.delayed(const Duration(seconds: 1));
    lgService.forceRefresh(1);

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('KML Cleaned')));
  }

  Future<void> _cleanLogos(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);
    final connected = await lgService.connectToLG();

    if (!context.mounted) return;

    if (connected != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not connect with the Liquid Galaxy'),
        ),
      );
      return;
    }
    await lgService.cleanLogos();
    await Future.delayed(const Duration(seconds: 1));
    lgService.forceRefresh(1);

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logos Cleaned')));
  }

  Future<void> _cleanAll(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);
    final connected = await lgService.connectToLG();

    if (!context.mounted) return;

    if (connected != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not connect with the Liquid Galaxy'),
        ),
      );
      return;
    }
    await lgService.cleanAll();
    await Future.delayed(const Duration(seconds: 1));
    lgService.forceRefresh(1);

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Cleaning Done!')));
  }

  Future<void> _sendPyramidKml(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);
    final connected = await lgService.connectToLG();

    if (!context.mounted) return;

    if (connected != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not connect with the Liquid Galaxy'),
        ),
      );
      return;
    }
    String sampleKml;
    try {
      sampleKml = await rootBundle.loadString('assets/kml/pyramid.kml');
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('There was an error loading the KML file: $e')),
      );
      return;
    }
    await lgService.uploadKml(sampleKml, 'pyramid.kml');
    await Future.delayed(const Duration(seconds: 1));
    lgService.forceRefresh(1);
    await lgService.flyTo(
      '<LookAt><longitude>0</longitude><latitude>-3</latitude><altitude>0</altitude><heading>0</heading><tilt>60</tilt><range>2000000</range><altitudeMode>relativeToGround</altitudeMode></LookAt>',
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('The great pyramid of KML!')));
  }

  Future<void> _startOrbit(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);

    final connected = await lgService.connectToLG();

    if (!context.mounted) return;

    if (connected != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not connect with the Liquid Galaxy'),
        ),
      );
      return;
    }

    String kmlContent = '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
  <Document>
    <name>PyramidOrbit</name>
    <open>1</open>

    <Style id="megaPyramid">
      <LineStyle>
        <width>1</width>
        <color>ffffffff</color>
      </LineStyle>
      <PolyStyle>
        <color>9900d7ff</color>
        <fill>1</fill>
        <outline>1</outline>
      </PolyStyle>
    </Style>

    <Placemark>
      <name>The Colossal Pyramid</name>
      <styleUrl>#megaPyramid</styleUrl>
      <MultiGeometry>
        <Polygon>
          <altitudeMode>relativeToGround</altitudeMode>
          <outerBoundaryIs>
            <LinearRing>
              <coordinates>
                -2.5,-2.5,0 2.5,-2.5,0 0,0,200000 -2.5,-2.5,0
              </coordinates>
            </LinearRing>
          </outerBoundaryIs>
        </Polygon>
        <Polygon>
          <altitudeMode>relativeToGround</altitudeMode>
          <outerBoundaryIs>
            <LinearRing>
              <coordinates>
                2.5,-2.5,0 2.5,2.5,0 0,0,200000 2.5,-2.5,0
              </coordinates>
            </LinearRing>
          </outerBoundaryIs>
        </Polygon>
        <Polygon>
          <altitudeMode>relativeToGround</altitudeMode>
          <outerBoundaryIs>
            <LinearRing>
              <coordinates>
                2.5,2.5,0 -2.5,2.5,0 0,0,200000 2.5,2.5,0
              </coordinates>
            </LinearRing>
          </outerBoundaryIs>
        </Polygon>
        <Polygon>
          <altitudeMode>relativeToGround</altitudeMode>
          <outerBoundaryIs>
            <LinearRing>
              <coordinates>
                -2.5,2.5,0 -2.5,-2.5,0 0,0,200000 -2.5,2.5,0
              </coordinates>
            </LinearRing>
          </outerBoundaryIs>
        </Polygon>
      </MultiGeometry>
    </Placemark>

    <gx:Tour>
      <name>Orbit</name>
      <gx:Playlist>
    ''';

    double heading = 0;
    while (heading <= 360) {
      kmlContent +=
          '''
        <gx:FlyTo>
          <gx:duration>1.2</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>0</longitude>
            <latitude>-0.5</latitude>
            <altitude>0</altitude>
            <heading>$heading</heading>
            <tilt>60</tilt>
            <range>2000000</range>
            <gx:altitudeMode>relativeToGround</gx:altitudeMode>
          </LookAt>
        </gx:FlyTo>
      ''';
      heading += 10;
    }

    kmlContent += '''
      </gx:Playlist>
    </gx:Tour>
  </Document>
</kml>
    ''';

    await lgService.uploadKml(kmlContent, 'pyramid_orbit.kml');

    await Future.delayed(const Duration(seconds: 2));

    await lgService.startTour('Orbit');

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Orbiting the Pyramid!')));
  }

  Future<void> _stopOrbit(BuildContext context) async {
    final lgService = Provider.of<LgService>(context, listen: false);

    await lgService.stopTour();

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Orbit stopped')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConnectionScreen()),
          );
        },
        label: const Text('Connection'),
        icon: const Icon(Icons.wifi),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _sendLogo(context),
                      child: const Text('Send the LG logo'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _sendHomeKml(context),
                      child: const Text('Fly to my Hometown!'),
                    ),
                  ),
                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _sendPyramidKml(context),
                      child: const Text('3D pyramid KML'),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _startOrbit(context),
                          child: const Text('Start Orbit'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _stopOrbit(context),
                          child: const Text('Stop Orbit'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _cleanKml(context),
                      child: const Text('Clean KML'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _cleanLogos(context),
                      child: const Text('Clean Logos'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _cleanAll(context),
                      child: const Text('Clean KML and logos'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final lg = LgService();

                      await lg.connectToLG();

                      final pos = await IssService.fetchPosition();
                      final kml = generateIssKml(pos.lat, pos.lon);

                      await lg.uploadKml(kml, 'iss.kml');

                      final lookAt =
                          '<LookAt><longitude>${pos.lon}</longitude><latitude>${pos.lat}</latitude>'
                          '<altitude>0</altitude><heading>0</heading><tilt>60</tilt>'
                          '<range>1500000</range><altitudeMode>relativeToGround</altitudeMode></LookAt>';

                      await lg.flyTo(lookAt);
                    },
                    child: const Text('Show ISS Live'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
