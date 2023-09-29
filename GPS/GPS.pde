import processing.serial.*;

Serial serialPort;  // Serial port object

float referenceLatitude = 33.8554414;
float referenceLongitude = -84.444932;
float heading = 0.0;  // Initial heading value
float altitude = 0.0;  // Initial altitude value
int satellites = 0;  // Initial number of satellites value
float latitudeDecimal = 0.0;  // Initial latitude in decimal degrees
float longitudeDecimal = 0.0;  // Initial longitude in decimal degrees
float speed = 0.0;  // Initial speed value
float distance = 0.0;  // Initial distance from reference point value
String time = "";  // Time value

ArrayList<PVector> visitedPoints;  // List to store visited points

int graphX = 250;  // X-coordinate of the graph box
int graphY = 50;  // Y-coordinate of the graph box
int graphWidth = 500;  // Width of the graph box
int graphHeight = 400;  // Height of the graph box

void setup() {
  size(800, 600);
  visitedPoints = new ArrayList<PVector>();  // Initialize the visitedPoints list

  // Replace "/dev/cu.usbmodem1101" with the appropriate port name for your GPS unit
  serialPort = new Serial(this, "/dev/cu.usbmodem1101", 9600);
}

void draw() {
  background(255);
  drawGraph();  // Call the function to draw the graph
  displayTextData();  // Call the function to display text data

  while (serialPort.available() > 0) {
    String data = serialPort.readStringUntil('\n');  // Read a line from the serial port

    if (data != null) {
      data = trim(data);  // Remove any leading/trailing white space

      // Split the data into individual values
      String[] values = splitTokens(data, ",");

      if (values.length > 0) {
        String messageType = values[0];

        // Check if the message type is speed data
        if (messageType.equals("$GPVTG")) {
          if (values.length > 7) {
            float headingValue = 0.0;
            if (!values[1].isEmpty()) {
              headingValue = parseFloat(values[1]);  // Extract the heading value
              heading = headingValue;  // Update the heading
            }
            float speedValue = 0.0;
            if (!values[7].isEmpty()) {
              speedValue = parseFloat(values[7]);  // Extract the speed value
              speed = speedValue;  // Update the speed
            }
            println("Heading: " + heading + " degrees");
            println("Speed: " + speed);
          } else {
            println("Invalid speed data");
          }
        }

        // Check if the message type is position data
        if (messageType.equals("$GPGGA")) {
          if (values.length > 9) {
            String latitude = values[2];   // Extract the latitude value
            String latitudeHemisphere = values[3];   // Extract the latitude hemisphere
            String longitude = values[4];  // Extract the longitude value
            String longitudeHemisphere = values[5];  // Extract the longitude hemisphere
            println("Position: " + latitude + " " + latitudeHemisphere + ", " + longitude + " " + longitudeHemisphere);

            // Convert latitude and longitude to decimal degrees
            latitudeDecimal = convertToDecimalDegrees(latitude, latitudeHemisphere);
            longitudeDecimal = convertToDecimalDegrees(longitude, longitudeHemisphere);
            println("Decimal Degrees: " + latitudeDecimal + ", " + longitudeDecimal);

            // Calculate distance from reference point
            distance = calculateDistance(referenceLatitude, referenceLongitude, latitudeDecimal, longitudeDecimal);
            println("Distance: " + distance + " meters");

            // Extract the altitude value
            if (!values[9].isEmpty()) {
              altitude = parseFloat(values[9]);
              println("Altitude: " + altitude + " meters");
            } else {
              println("Invalid altitude data");
            }

            // Extract the number of satellites value
            if (values.length > 7 && !values[7].isEmpty()) {
              satellites = parseInt(values[7]);
              println("Satellites: " + satellites);
            } else {
              println("Invalid satellites data");
            }

            // Add the current position to the visited points list
            visitedPoints.add(new PVector(latitudeDecimal, longitudeDecimal));
          } else {
            println("Invalid position data");
          }
        }

        // Check if the message type is time data
        if (messageType.equals("$GPRMC")) {
          if (values.length > 9) {
            String timeValue = values[1];  // Extract the time value
            time = formatTime(timeValue);
            println("Time: " + time);
          } else {
            println("Invalid time data");
          }
        }
      }
    }
  }
}

// Draw the graph
// Draw the graph
// Draw the graph
void drawGraph() {
  // Draw the graph box
  stroke(0);
  fill(255);
  rect(graphX, graphY, graphWidth, graphHeight);

  // Draw the visited points
  noFill();
  stroke(255, 0, 0); // Red color for the points

  beginShape();
  for (int i = 0; i < visitedPoints.size(); i++) {
    PVector point = visitedPoints.get(i);
    float x = map(point.x, referenceLatitude - 0.01, referenceLatitude + 0.01, graphX, graphX + graphWidth);
    float y = map(point.y, referenceLongitude - 0.01, referenceLongitude + 0.01, graphY + graphHeight, graphY);
    vertex(x, y);
  }
  endShape();
}


// Display the text data on the side
void displayTextData() {
  // Display the last known heading
  textAlign(LEFT);
  textSize(18);
  fill(0);
  text("Last Known Heading: " + heading + " degrees", 50, 50);

  // Display the altitude in feet
  text("Altitude: " + altitude * 3.28084 + " feet", 50, 80);

  // Display the number of satellites
  text("Satellites: " + satellites, 50, 110);

  // Display the latitude and longitude
  text("Latitude: " + latitudeDecimal, 50, 140);
  text("Longitude: " + longitudeDecimal, 50, 170);

  // Display the speed in mph
  if (speed != 0.0) {
    text("Speed: " + speed * 0.621371 + " mph", 50, 200);
  } else {
    text("Speed: 0 mph", 50, 200);
  }

  // Display the distance from reference point
  text("Distance: " + distance + " meters", 50, 230);

  // Display the time
  text("Time: " + time, 50, 260);
}

// Convert degrees, minutes, seconds to decimal degrees
float convertToDecimalDegrees(String coordinate, String hemisphere) {
  float degrees = Float.parseFloat(coordinate.substring(0, 2));
  float minutes = Float.parseFloat(coordinate.substring(2, 4));
  float seconds = Float.parseFloat(coordinate.substring(4));
  float decimalDegrees = degrees + minutes / 60.0 + seconds / 3600.0;

  if (hemisphere.equals("S") || hemisphere.equals("W")) {
    decimalDegrees = -decimalDegrees;
  }

  return decimalDegrees;
}

// Calculate distance between two points using haversine formula
float calculateDistance(float lat1, float lon1, float lat2, float lon2) {
  float R = 6371000.0;  // Radius of the Earth in meters
  float dlat = radians(lat2 - lat1);
  float dlon = radians(lon2 - lon1);
  float a = sin(dlat / 2) * sin(dlat / 2) + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon / 2) * sin(dlon / 2);
  float c = 2 * atan2(sqrt(a), sqrt(1 - a));
  float distance = R * c;
  return distance;
}

// Format time in HH:MM:SS format
String formatTime(String timeValue) {
  String hours = timeValue.substring(0, 2);
  String minutes = timeValue.substring(2, 4);
  String seconds = timeValue.substring(4, 6);
  String formattedTime = hours + ":" + minutes + ":" + seconds;
  return formattedTime;
}
