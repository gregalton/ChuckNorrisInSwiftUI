# ChuckNorrisInSwiftUI

I went looking for a free public API for a simple SwiftUI example and found https://api.chucknorris.io.

TODO:
- Add Header Image
- Test Drive the networking logic in a framework for MacOS. Unit tests run much faster when they don't need a simulator. This also decouples the networking module from the UI, allowing, for instance to use other networking modules for other APIs. I'll apply depndency inversion through a protocol to allow for using a test spy that removes the network dependency.
