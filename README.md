# emacs-guess-wrapped-text: autowrap text in emacs as needed
Bart Massey and Google Gemini Flash 2025

This grotty code uses a simple heuristic (more than 5 lines
of at least 100 characters in the buffer, or a single line
of at least 150 characters) to turn on a "wrapped-text" mode
on text or Markdown buffers in emacs: `visual-line-mode`
with `auto-fill -1`. The heuristic parameters can be set to
taste.

I have more and more Markdown, in particular, that needs to
be edited as wrapped. However, the majority of my Markdown
does not.

## Usage

Put `guess-wrapped-text.el` someplace where emacs can find
it. Then add `(load-library "guess-wrapped-text")` to your
`.emacs`.

## License

This work is made available under the "MIT License". See the
file `LICENSE.txt` in this distribution for license terms.
