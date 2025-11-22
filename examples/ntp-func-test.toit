import mqtt-e2e show ntp-time
import log

// helper function, based on the ntp module and :
//
// blocks until the time is correct for the first time
// spawns a task to ajust the time periodically
// returns and allows the program to proceed
// This is mandatory for time based(stateless) crypto code
//
// run with
// jag run -d host ntp-func-test.toit
//

main:
  // You supress the debug messages with
  // log.set-default (log.default.with-level log.INFO_LEVEL)
  //
  // Usually you want to put :
  //
  // ntp-time
  //
  // at the start of main
  //
  ntp-time
  // try theese :
  // --refresh=(Duration --s=15) to see the operation fast-forward
  // --server="10.11.12.13" // the query will fail with this, blocking the app
  //
  // With the wrong NTP server you will not see this
  // This enforces the time to be correct before proceed
  print "**** When you see this, the time is correct. *****"
  print "**** The \"ntp-time\" function is returned ****"
  print "**** but a task is running to adjust the time every 1h****"
  print
  print "**** The debug message that follows is from the backgroud task ****"