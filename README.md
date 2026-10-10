# Guess My Number

Simple "Guess My Number" CLI game implemented in multiple languages.<br>
This is a study project.<br>

---
## Objectives
* Merge old C and Free Pascal projects into one new multilanguage project.
* Rewrite the logic in both versions to achieve identical results.
* Restructure both versions for clean and complex multiunit structure.
* Rewrite in simple clear CLI interface with prompt and displayed scores.
* Implement a datafile (separate or shared?) that stores the score records.

## Additional
* Maintain a multilanguage project with identical behaviour in all implementations.
* Maintain a common Makefile that compiles and runs all different implementations.
* Add more languages, compiled and interpreted (in command line mode).
* Add colors to the TUI

## Notes
* **Pascal** to fix bug: the window size and adjust coordinates for TUI on window resize:<br>
  can't do with CRT in Pascal, so require lower level access.
* **Pascal** to fix bugs: bad (non integer) input leads to crash, line shift on empty Enter.
* ~~**Pascal** to add feature: force quit on Q (return screen buffer back).~~

---
## License
Distributed under the **MIT License**, see [LICENSE](LICENSE) for more details.
