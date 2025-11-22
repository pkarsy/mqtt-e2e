import .mqtt-comm show ntp-time

// run with
// jag run -d host ntp-func-test.toit
//

main:
  // Usually
  //
  // ntp-time
  //
  // is enough will fetch the time every 1h
  //
  ntp-time --debug=true --refresh=(Duration --s=15) //--server="10.11.12.13" // the query will fail with this
  // With the wrong NTP server you will not see this
  // This enforces the time to be correct before proceed
  print "**** If you see this the time is correct. *****"
  print "**** The function returned but a NTP loop (task) is running ! ****"
