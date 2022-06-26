import ArgumentParser
import Foundation

struct Arguments: ParsableCommand {
  @Argument(help: "Input file")
  var input: String

  @Argument(help: "Output file")
  var output: String
}

let args = Arguments.parseOrExit()

let fileManager = FileManager.init()

if !fileManager.fileExists(atPath: args.input) {
  print("The provided input path does not exist")
} else if !fileManager.fileExists(atPath: args.output) {
  print("The provided output path does not exist")
}

do {
  try fileManager.copyItem(atPath: args.input, toPath: args.output)
  print("Copying the requested file")
} catch {
  print("An unexpected error occurred while copying the request file over")
}