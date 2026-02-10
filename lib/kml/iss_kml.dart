String generateIssKml(double lat, double lon) {
  return '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Placemark>
    <name>ISS</name>
    <description>International Space Station (Live)</description>
    <Style>
      <IconStyle>
        <scale>1.5</scale>
        <Icon>
          <href>https://upload.wikimedia.org/wikipedia/commons/d/d0/International_Space_Station.svg</href>
        </Icon>
      </IconStyle>
    </Style>
    <Point>
      <coordinates>$lon,$lat,400000</coordinates>
    </Point>
  </Placemark>
</kml>
''';
}
