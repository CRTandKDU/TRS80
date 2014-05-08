;;; bl2.el --- Converts BASIC Level 2 source to cassette format
;;
;;; Commentary:
;; See also: [[https://ia601705.us.archive.org/16/items/Level_II_ROMs_1st_Edition_1983_Tab_Books/Level_II_ROMs_1st_Edition_1983_Tab_Books.pdf]]
;;
;;; Change Log:
;; 4/10/2014 jmc Created
;;
;;; Code:

;; Lexer
(defconst *bl2-tokens* 
  '(("END" . 128) ("FOR" . 129) ("KILL" . 170) ("OR" . 211) ("RESET" . 130) ("LSET" . 171) (">" . 212) ("SET" . 131) ("RSET" . 172) ("=" . 213) ("CLS" . 132) ("SAVE" . 173) ("<" . 214) ("CMD" . 133) ("SYSTEM" . 174) ("SGN" . 215) ("RANDOM" . 134) ("LPRINT" . 175) ("INT" . 216) ("NEXT" . 135) ("DEF" . 176) ("ABS" . 217) ("DATA" . 136) ("POKE" . 177) ("FRE" . 218) ("INPUT" . 137) ("PRINT" . 178) ("INP" . 219) ("DIM" . 138) ("CONT" . 179) ("POS" . 220) ("READ" . 139) ("LIST" . 180) ("SQR" . 221) ("LET" . 140) ("LLIST" . 181) ("RND" . 222) ("GOTO" . 141) ("DELETE" . 182) ("LOG" . 223) ("RUN" . 142) ("AUTO" . 183) ("EXP" . 224) ("IF" . 143) ("CLEAR" . 184) ("COS" . 225) ("RESTORE" . 144) ("CLOAD" . 185) ("SIN" . 226) ("GOSUB" . 145) ("CSAVE" . 186) ("TAN" . 227) ("RETURN" . 146) ("NEW" . 187) ("ATN" . 228) ("REM" . 147) ("TAB(" . 188) ("PEEK" . 229) ("STOP" . 148) ("TO" . 189) ("CVI" . 230) ("ELSE" . 149) ("FN" . 190) ("CVS" . 231) ("TRON" . 150) ("USING" . 191) ("CVD" . 232) ("TROFF" . 151) ("VARPTR" . 192) ("EOF" . 233) ("DEFSTR" . 152) ("USR" . 193) ("LOC" . 234) ("DEFINT" . 153) ("ERL" . 194) ("LOF" . 235) ("DEFSNG" . 154) ("ERR" . 195) ("MKI$" . 236) ("DEFDBL" . 155) ("STRING$" . 196) ("MKS$" . 237) ("LINE" . 156) ("INSTR" . 197) ("MKD$" . 238) ("EDIT" . 157) ("POINT" . 198) ("CINT" . 239) ("ERROR" . 158) ("TIME$" . 199) ("CSNG" . 240) ("RESUME" . 159) ("MEM" . 200) ("CDBL" . 241) ("OUT" . 160) ("INKEY$" . 201) ("FIX" . 242) ("ON" . 161) ("THEN" . 202) ("LEN" . 243) ("OPEN" . 162) ("NOT" . 203) ("STR$" . 244) ("FIELD" . 163) ("STEP" . 204) ("VAL" . 245) ("GET" . 164) ("+" . 205) ("ASC" . 246) ("PUT" . 165) ("-" . 206) ("CHR$" . 247) ("CLOSE" . 166) ("*" . 207) ("LEFT$" . 248) ("LOAD" . 167) ("/" . 208) ("RIGHT$" . 249) ("MERGE" . 168) ("^" . 209) ("MID$" . 250) ("NAME" . 169) ("AND" . 210) ("'" 58 147 251))
  "BASIC Level 2 Tokens"
  )

(defun bl2-lex-match-token ()
  "Search for exact token match at char"
  ;; (skip-chars-forward " \t")
  (or
   (and
    (<= (+ 7 (point)) (point-max))
    (assoc (buffer-substring (point) (+ 7 (point))) *bl2-tokens*))
   (and
    (<= (+ 6 (point)) (point-max))
    (assoc (buffer-substring (point) (+ 6 (point))) *bl2-tokens*))
   (and
    (<= (+ 5 (point)) (point-max))
    (assoc (buffer-substring (point) (+ 5 (point))) *bl2-tokens*))
   (and
    (<= (+ 4 (point)) (point-max))
    (assoc (buffer-substring (point) (+ 4 (point))) *bl2-tokens*))
   (and
    (<= (+ 3 (point)) (point-max))
    (assoc (buffer-substring (point) (+ 3 (point))) *bl2-tokens*))
   (and
    (<= (+ 2 (point)) (point-max))
    (assoc (buffer-substring (point) (+ 2 (point))) *bl2-tokens*))
   (and
    (<= (+ 1 (point)) (point-max))
    (assoc (buffer-substring (point) (+ 1 (point))) *bl2-tokens*))
   )
  )

(defun bl2-lex-line-number ()
  "Returns line number or nil"
  (let ((reg "[[:digit:]]+")
	)
    (and (re-search-forward reg (+ 64 (point)) t)
	 (string-to-number (match-string 0))
      )
    )
  )

(defun bl2-lex-line (&optional line-addr)
  "Tokenize a full line, returning new line address consed to list of chars"
  (let* ((line-addr (or line-addr 17129))
	 (tokens nil)
	 (byte-count line-addr)
	 (line-no (bl2-lex-line-number))
	 (forward-cursor 
	  (lambda ()
	    (setq tokens (append tokens (list (char-after)))
		  byte-count (1+ byte-count))
	    (forward-char)
	    )
	  )
	)
    (cond
     ;; Line begins with line number
     (line-no 
      (setq tokens (append tokens (bl2-lsbmsb line-no))
	    byte-count (+ 5 byte-count) ;; next-addr 2B, line-no 2B, eol 1B
	    )
      (while (not (eolp))
	(cond
	 ;; Opening double quote: scan up to closing quote
	 ((equal ?\" (char-after))
	  (funcall forward-cursor)
	  (while (not (equal ?\" (char-after)))
	    (funcall forward-cursor)
	    )
	  (funcall forward-cursor)
	  )
	 ;; Token match
	 (t
	  (let ((match (bl2-lex-match-token)))
	    (cond
	     (match 
	      (forward-char (length (car match)))
	      (setq tokens (append tokens 
				   (if (listp (cdr match)) 
				       (cdr match)
				     (list (cdr match))))
		    byte-count (if (listp (cdr match))
				   (+ byte-count (length (cdr match)))
				 (1+ byte-count))
		    )
	      ;; Special statements
	      (cond
	       ;; `REM', `'': pass through to end of line
	       ((or (string= "REM" (car match)) (string= "'" (car match)))
		(while (not (eolp)) (funcall forward-cursor))
		)
	       )
	      )
	     (t
	      (if (not (eolp))
		  (funcall forward-cursor))
	      )
	     )
	    )
	  )
	 )
	)
      )
     ;; Missing 
     (t (message "Error: Missing line number at point"))
     )
    (cons byte-count (append (bl2-lsbmsb byte-count) tokens))
    )
  )


(defun bl2-lex (start end)
  "Tokenize region to cassette BASIC format in `*cassette*' buffer"
  (interactive "r")
  (bl2-cassette)
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
;;      (message (format "%d %d" (point-min) (point-max)))
      (let ((line-addr 17129)
	    (buf (get-buffer-create "*cassette*"))
	    )
	(while (not (eobp))
	  (let ((line-tokens (bl2-lex-line line-addr))
		)
	    (with-current-buffer buf
	      (insert (concat (cdr line-tokens))) ;; Tokenized BASIC
	      (insert ?\x0)) ;; eol
	    ;;	    (insert (format "%s\n" line-tokens)))
	    (setq line-addr (car line-tokens))
	    (forward-line 1)
	    )
	  )
	)
      )
    )
  )

(defun bl2-lsbmsb (n)
  "Returns LSB MSB"
  (let ((msb (/ n 256)))
    (list (- n (* 256 msb)) msb))
  )

(defun bl2-cassette (&optional char-file-name)
  "Builds a BASIC blank cassette compatible with sdltrs, TRS32 emulators"
  (let ((buf (get-buffer-create "*cassette*"))
	(cfn (or char-file-name ?A))
	)
    (with-current-buffer buf
      (set-buffer-multibyte nil)
      (set-buffer-file-coding-system 'undecided-unix t)
      (erase-buffer)
      ;; End of file marker
      (insert ?\x0 ?\x0)
      ;; BASIC tape format leader
      (goto-char (point-min))
      (dotimes (i 255) (insert ?\x0))
      (insert ?\xA5 ?\xD3 ?\xD3 ?\xD3 cfn)
      ;;
      (point)
      )
    )
  )

(provide 'bl2)
;;; bl2.el ends here

