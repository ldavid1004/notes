<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. url</a>
<ul>
<li><a href="#sec-1-1">1.1. fonts</a></li>
<li><a href="#sec-1-2">1.2. org-mode</a></li>
</ul>
</li>
<li><a href="#sec-2">2. fonts</a>
<ul>
<li><a href="#sec-2-1">2.1. How to find the current font used?</a></li>
<li><a href="#sec-2-2">2.2. How to change font size</a></li>
<li><a href="#sec-2-3">2.3. How to set default font in emacs init file ?</a></li>
<li><a href="#sec-2-4">2.4. How do you get the elements of a font list familiy ?</a></li>
</ul>
</li>
<li><a href="#sec-3">3. org-mode</a>
<ul>
<li><a href="#sec-3-1">3.1. customize backends ( add markdown )</a></li>
<li><a href="#sec-3-2">3.2. export to markdown file</a></li>
</ul>
</li>
</ul>
</div>
</div>

# url<a id="sec-1" name="sec-1"></a>

## fonts<a id="sec-1-1" name="sec-1-1"></a>

<http://ergoemacs.org/emacs/emacs_list_and_set_font.html>

## org-mode<a id="sec-1-2" name="sec-1-2"></a>

<http://orgmode.org/manual/Markdown-export.html>

# fonts<a id="sec-2" name="sec-2"></a>

## How to find the current font used?<a id="sec-2-1" name="sec-2-1"></a>

describe-char

## How to change font size<a id="sec-2-2" name="sec-2-2"></a>

C-x C-+
C-x C&#x2013;

## How to set default font in emacs init file ?<a id="sec-2-3" name="sec-2-3"></a>

(cond 
 ((string-equal system-type "darwin") ; Mac OS X
  (when (member "Menlo" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "-\*-Menlo-normal-normal-normal-\*-21-\*-\*-\*-m-0-iso10646-1"))
    (add-to-list 'default-frame-alist '(font . "-\*-Menlo-normal-normal-normal-\*-21-\*-\*-\*-m-0-iso10646-1")))))

## How do you get the elements of a font list familiy ?<a id="sec-2-4" name="sec-2-4"></a>


(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (progn
    (insert "\n")
    (while list
      (insert (car list) "\n")
      (setq list (cdr list)))))

(print-elements-of-list (font-family-list))
(print-elements-of-list (fontset-list))

# org-mode<a id="sec-3" name="sec-3"></a>

## customize backends ( add markdown )<a id="sec-3-1" name="sec-3-1"></a>

customizing org-export-backends

## export to markdown file<a id="sec-3-2" name="sec-3-2"></a>

C-c C-e m m     (org-md-export-to-markdown)