import Formatting
import Foundation



format("Hello, " % string % "! It's " % K % " o'clock.", "world", Date())



let dateFormatter =
  format(yyyy % "-" <> MM % "-" <> dd)

dateFormatter(Date())



let longDateFormatter =
  format(date(.longStyle))

longDateFormatter(Date())



format(bytes)(1024)



let logFormatter =
  format(fitLeft(5) .% right(5) % " -- [" % iso8601 % "] " % string)

let infoLog = logFormatter("INFO")
let debugLog = logFormatter("DEBUG")

print(infoLog(Date())("Logging in..."))
print(debugLog(Date())("Logged in successfully!"))
