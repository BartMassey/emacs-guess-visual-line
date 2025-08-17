# emacs-guess-visual-line: autowrap text in emacs as needed
Bart Massey and Google Gemini Flash 2025

This grotty code uses a simple heuristic (more than 5 lines
of at least 100 characters in the buffer, or a single line
of at least 150 characters) to turn on `visual-line-mode` on
text or Markdown buffers in emacs. The heuristic parameters
can be set to taste.

I have more and more Markdown, in particular, that needs to
be wrapped. However, the majority of my Markdown does not.

## Usage

Put `guess-visual-line.el` someplace where emacs can find
it. Then add `(load-library "guess-visual-line")` to your
`.emacs`.

## License

This work is made available under the "MIT License". See the
file `LICENSE.txt` in this distribution for license terms.
