// Used by "controller-example.toit"
// and "iot-example.toit"

import mqtt-e2e show MqttE2E
pad-size ::= 60
controller-suffix ::= "controller"
mqtt-host ::= MqttE2E.hivemq

// For the examples to work you need a 16-byte, Random, Unique key
// run the "tools/gen-key.toit" to generate one
// Or the python one-liner:
// python3 -c "import secrets, textwrap; b=secrets.token_bytes(16); print('#['+', '.join(f'0x{x:02x}' for x in b)+']')"
//encryption-key ::=  #[0xaf,]

aes-key ::=  #[0x76, 0x2e, 0x4c, 0x1d, 0xc0, 0xa7, 0xd8, 0xb6, 0x0e, 0x61, 0xbc, 0x68, 0xdc, 0x85, 0x8b, 0xee]

