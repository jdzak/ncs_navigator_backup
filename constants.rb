module Constants
  IOS = "/Users/johndzak/Library/Application\ Support/iPhone\ Simulator/5.0/Applications/BC627ECF-83B3-41AE-87E3-3F3BA5C5E066/Documents/main.sqlite"

  def command(desc, &block)
    yield
    r = ($? == 0) ? "Success" : "Failed"
    puts "#{r}: #{desc}"
    ($? == 0)
  end
end