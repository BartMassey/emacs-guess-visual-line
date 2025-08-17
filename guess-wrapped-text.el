; Code by Google Gemini Flash 2.5 2025-08-02
; with extensive help from Bart Massey.
;
; Dont use Gemini Flash to code.

(defcustom guess-wrapped-text-nlines 5
  "The number of lines longer than `guess-wrapped-text-nchars`
that must be present in a buffer for \"wrapped text\" modes to be activated."
  :type 'integer
  :group 'wrapped-text)

(defcustom guess-wrapped-text-nchars 100
  "The minimum length a line must be to count towards
`guess-wrapped-text-nlines`."
  :type 'integer
  :group 'wrapped-text)

(defcustom guess-wrapped-text-force-nchars 150
  "The minimum length a single line must be to enforce wrapped-text modes."
  :type 'integer
  :group 'wrapped-text)

(defun guess-wrapped-text ()
  "Enable \"wrapped text\" modes if the buffer contains a sufficient number
of long lines.
The thresholds are controlled by `guess-wrapped-text-nchars` and
`guess-wrapped-text-nlines`."
  (visual-line-mode -1)
  (auto-fill-mode 1)
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

          (when (> line-length guess-wrapped-text-nchars)
            (setq long-line-count (1+ long-line-count)))

          ; Move to the next line
          (forward-line 1)

          (when (or
                 (>= line-length guess-wrapped-text-force-nchars)
                 (>= long-line-count guess-wrapped-text-nlines))
            (progn
              (visual-line-mode 1)
              (message "Turning off auto-fill-mode")
              (auto-fill-mode -1)
              (message "Auto-fill-mode status: %s" auto-fill-function)
              (setq done t))))))))

(add-hook 'text-mode-hook #'guess-wrapped-text)
(add-hook 'markdown-mode-hook #'guess-wrapped-text)
