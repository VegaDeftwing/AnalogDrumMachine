// MCP466_DigitalPot_Example
#include <Wire.h>
#include <MCP466_DigitalPot.h>
#include<stdint.h>


#define mcpAddress         0x2F
#define volatileWiper0     0x00
#define volatileWiper1     0x01
#define nonvolatileWiper0  0x02
#define nonvolatileWiper1  0x03
#define TCON               0x04
#define mcpSTATUS          0x05 

// Construct an instance of the MCP466_DigitalPot class
MCP466_DigitalPot examplePot(mcpAddress);

void setup()
{
  // Enable I2C Communications
  Wire.begin();
  
  // Set serial port baud rate for debug messages
  Serial.begin(9600);

  long resistance0 = 100000;
  long wiperValue0 = resistance0 / 380;
  Serial.println(wiperValue0);

  long resistance1 = 50000;
  long wiperValue1 = resistance1 / 380;
  Serial.println(wiperValue1);

  examplePot.mcpWrite(volatileWiper0, wiperValue0);
  Serial.println(examplePot.mcpRead(volatileWiper0));

  examplePot.mcpWrite(volatileWiper1, wiperValue1);
  Serial.println(examplePot.mcpRead(volatileWiper1));
}

void loop()
{

}
