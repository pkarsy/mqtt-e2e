import mqtt-e2e show random-key
import log

// Run the program with
// jag run -d host gen-key.toit

main:
  // to prevent the key showing 2 times, it is unnecessary.
  log.set-default (log.default.with-level log.INFO_LEVEL)
  print "The following key can be used for your new project"
  print random-key