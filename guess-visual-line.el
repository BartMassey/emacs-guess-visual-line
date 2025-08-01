; Code by Google Gemini Flash 2.5 2025-08-02
; with extensive help from Bart Massey.
;
; Dont use Gemini Flash to code.

(defcustom guess-visual-line-nlines 5
  "The number of lines longer than `guess-visual-line-nchars`
that must be present in a buffer for `visual-line-mode` to be activated."
  :type 'integer
  :group 'visual-line)

(defcustom guess-visual-line-nchars 100
  "The minimum length a line must be to count towards
`guess-visual-line-nlines`."
  :type 'integer
  :group 'visual-line)

(defun guess-visual-line ()
  "Enable `visual-line-mode` if the buffer contains a sufficient number of long lines.
The thresholds are controlled by `guess-visual-line-nchars` and
`guess-visual-line-nlines`."
  (let ((long-line-count 0)
        (done nil))
    (save-excursion
      (goto-char (point-min))
      ; Loop until the end of the buffer
      (while (and (not done) (not (eobp)))
        (let* ((line-start (point))
               (line-end (line-end-position))
               ; Calculate the length
               (line-length (- line-end line-start)))

          (when (> line-length guess-visual-line-nchars)
            (setq long-line-count (1+ long-line-count)))

          ; Move to the next line
          (forward-line 1)

          (when (>= long-line-count guess-visual-line-nlines)
            (visual-line-mode 1)
            (setq done t)))))))

(add-hook 'text-mode-hook #'guess-visual-line)
(add-hook 'markdown-mode-hook #'guess-visual-line)
