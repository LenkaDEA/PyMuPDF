Þ    e      D              l  $   m  §     f   :  ÷   ¡  T     ©   î  H   	  d  á	  !   F  Î   h  S   7  ¸     Â   D  `       h  N   l  Ñ   »  ¿     +   M  K   y  #   Å  *   é  +     ,   @      m          ¥     ¸     Ó     ó           .  p   F  k   ·  :  #     ^  Ï   å     µ  O   =      o     "   ~  ð   ¡  v     ^   	  Â   h  E   +     q  ¥  ó           ³      O   T   D   ¤   Ó   é   w   ½!     5"     Q"  ã   ]"  :   A#  B   |#  Ü   ¿#  Q   $  à   î$  ¸   Ï%  >   &     Ç&  ÷   è'     à(    m)     +  3    +  c   T+  ,   ¸+  Ê   å+  X   °,  _   	-  0   i-     -  Ã   ).    í.  6   0     D0  r   Û0  V   N1     ¥1  8   <2     u2  J   2  O   Ø2  K   (3  B   t3     ·3     Ã3  l   Ï3  j   <4     §4  #   µ4     Ù4  .   í4    5  E   ¹6    ÿ6     8  x  8     :  Â   :  u   H;  ò  ¾;  /   ±=    á=  r   ô>  Ü   g?  ò   D@     7A  g  ÓA  T   ;C  B  C  ÿ   ÓD  9   ÓE  9   F  *   GF  9   rF  0   ¬F  6   ÝF  ?   G  -   TG     G  0   G  -   ÏG  0   ýG  0   .H     _H      ~H  ´   I  n  ÔI  ·   CK    ûK  °   M  W   ÉM  Ñ  !N     óO  A   sP  S  µP     	R     R  4  -S  X   bT  Ú   »T  Z  U     ñW  §  þW  ð   ¦Y  l   Z     [  ,  [     ·\  *   K]  !   v]  k  ]  `   _  ]   e_  ô   Ã_  {   ¸`  =  4a    rb  B   c    Ñc  =  ke  Û   ©f  *  g     °i  T   Éi     j  G   ¡j  '  éj     l     ¨l  9   )m  Ì   cm  *  0n  C  [o  T   p  ·   ôp  Ã   ¬q  Û   pr  ±   Ls  ?   þs  $   >t     ct  ~   út  x   yu  p   òu     cv     yv  _   v  Æ   ïv     ¶w     Éw  $   èw  f   x   "Predictable" in this context means: :meth:`Page.insert_font` -- install a font for the page for later reference. The result is reflected in the output of :meth:`Document.get_page_fonts`. The font can be: :meth:`Page.insert_text` -- write some lines of text. Internally, this uses :meth:`Shape.insert_text`. :meth:`Page.insert_textbox` -- fit text in a given rectangle. Here you can choose text alignment features (left, right, centered, justified) and you keep control as to whether text actually fits. Internally, this uses :meth:`Shape.insert_textbox`. All of the above is provided by three basic :ref:`Page`, resp. :ref:`Shape` methods: As shown here, upper / lower cases are **respected**. But this can be changed by using the string method *lower()* (or even regular expressions) in function *mark_word*. Both text insertion methods automatically install the font as necessary. But text **extraction** with the "dict" / "rawdict" options of :meth:`Page.get_text` may also return text with a non-zero angle to the x-axis. This is indicated by the value of the line dictionary's `"dir"` key: it is the tuple `(cosine, sine)` for that angle. If `line["dir"] != (1, 0)`, then the text of all its spans is rotated by (the same) angle != 0. But you also have other options:: By the above statement, the fontname *helv* is automatically connected to the Russian font variant of Helvetica. Any subsequent text insertion with **this fontname** will use the Russian Helvetica encoding. Every keyword is followed by its value -- no other text is present in between them. Extract a list of single words via *Page.get_text("words")*. Its items are words with position information. Use it to determine text contained in a given rectangle -- see next section. Extract text as a list of text blocks via *Page.get_text("blocks")*. Each item of this list contains position information for its text, which can be used to establish a convenient reading order. Extract text in HTML format and store it as a HTML document, so it can be viewed in any browser. Extracting tabular data from such a page area therefore means that you must find a way to **identify** the table area (i.e. its boundary box), then **(1)** graphically indicate table and column borders, and **(2)** then extract text based on this information. For example, the following five key-value pairs will be correctly identified:: Here is an example snippet of a page of this manual, where "MuPDF" has been used as the search string. Note that all strings **containing "MuPDF"** have been completely underlined (not just the search string). Here is another example. It inserts 4 text strings using the four different rotation options, and thereby explains, how the text insertion point must be chosen to achieve the desired result:: Here is the PDF page and the script output: How to :index:`Extract Table Content <pair: extract; table>` from Documents How to Analyze Font Characteristics How to Extract Key-Value Pairs from a Page How to Extract Text from within a Rectangle How to Extract Text in Natural Reading Order How to Extract all Document Text How to Fill a Text Box How to Insert Text How to Mark Extracted Text How to Mark Non-horizontal Text How to Mark Searched Text How to Use Non-Standard Encoding How to Write Text Lines However, for built-in fonts there are ways to calculate the line width beforehand - see :meth:`get_text_length`. If found, the **complete word containing the string** is marked (underlined) -- not only the search string. If the layout of a page is *"predictable"* in some sense, then there is a simple way to find the values for a given set of keywords fast and easily -- without using regular expressions. Please see `this <https://github.com/pymupdf/PyMuPDF-Utilities/tree/master/text-extraction/lookup-keywords.py>`_ example script. If you change the fontname just slightly, you can also achieve an **encoding "mixture"** for the **same base font** on the same page:: If you see a table in a document, you are normally not looking at something like an embedded Excel or other identifiable object. It usually is just normal, standard text, formatted to appear as tabular data. If you want to **mark the complete line** or a subset of its spans in one go, use the following snippet (works for v1.18.10 or later):: Line **width is ignored**. The surplus part of a line will simply be invisible. Method :meth:`Page.find_tables` does all that for you, with a high table detection precision. Its great advantage is that there are no external library dependencies, nor the need to employ artificial intelligence or machine learning technologies. It also provides an integrated interface to the well-known Python package for data analysis `pandas <https://pypi.org/project/pandas/>`_. One of the common issues with PDF text extraction is, that text may not appear in any particular reading order. Output some text lines on a page:: Please have a look at example `Jupyter notebooks <https://github.com/pymupdf/PyMuPDF-Utilities/tree/master/table-analysis>`_, which cover standard situations like multiple tables on one page or joining table fragments across multiple pages. PyMuPDF has several means to re-establish some reading sequence or even to re-generate a layout close to the original: PyMuPDF provides ways to insert text on new or existing PDF pages with the following features: Return may also be a list of :ref:`Quad` objects to precisely locate text that is **not parallel** to either axis -- using :ref:`Quad` output is also recommended, when page rotation is not zero. See the following two sections for examples and further explanations. Several default values were used above: font "Helvetica", font size 11 and text alignment "left". The result will look like this: Since v1.14, MuPDF allows Greek and Russian encoding variants for the :data:`Base14_Fonts`. In PyMuPDF this is supported via an additional *encoding* argument. Effectively, this is relevant for Helvetica, Times-Roman and Courier (and their bold / italic forms) and characters outside the ASCII code range only. Elsewhere, the argument is ignored. Here is how to request Russian encoding with the standard font Helvetica:: Text The "bboxes" returned by the method however are rectangles only -- not quads. So, to mark span text correctly, its quad must be recovered from the data contained in the line and span dictionary. Do this with the following utility function (new in v1.18.9):: The `spans` argument above may specify any sub-list of `line["spans"]`. In the example above, the second to second-to-last span are marked. If omitted, the complete line is taken. The bottom of the value's boundary box is **not above** the one of the keyword. The document can be any :ref:`supported type<Supported_File_Types>`. The output will be plain text as it is coded in the document. No effort is made to prettify in any way. Specifically for PDF, this may mean output not in usual reading order, unexpected line breaks and so forth. The previous section already shows an example for marking non-horizontal text, that was detected by text **searching**. The result looks like this: The result: The script works as a command line tool which expects the document filename supplied as a parameter. It generates one text file named "filename.txt" in the script directory. Text of pages is separated by a form feed character:: The search string can contain blanks and wrap across lines The search string may **not contain spaces** or other white space. The snippet above indeed leads to three different copies of the Helvetica font in the PDF. Each copy is uniquely identified (and referenceable) by using the correct upper-lower case spelling of the reserved word "helv":: The text sequence extracted from a page modified in this way will look like this: The valid encoding values are TEXT_ENCODING_LATIN (0), TEXT_ENCODING_GREEK (1), and TEXT_ENCODING_CYRILLIC (2, Russian) with Latin being the default. Encoding can be specified by all relevant font and text insertion methods. There are **no other restrictions**: the page layout may or may not be fixed, and the text may also have been stored as one string. Key and value may have any distance from each other. There is **no upper limit**: all occurrences will be detected. There is a standard search function to search for arbitrary text on a page: :meth:`Page.search_for`. It returns a list of :ref:`Rect` objects which surround a found occurrence. These rectangles can for example be used to automatically insert annotations which visibly mark the found text. There is now (v1.18.0) more than one way to achieve this. We therefore have created a `folder <https://github.com/pymupdf/PyMuPDF-Utilities/tree/master/textbox-extraction>`_ in the PyMuPDF-Utilities repository specifically dealing with this topic. This can be a very complex task, depending on details like the presence or absence of lines, rectangles or other supporting vector graphics. This is the responsibility of the PDF creator (software or a human). For example, page headers may have been inserted in a separate step -- after the document had been produced. In such a case, the header text will appear at the end of a page text extraction (although it will be correctly shown by PDF viewer software). For example, the following snippet will add some header and footer lines to an existing PDF:: This is the result: This method has advantages and drawbacks. Pros are: This script fills 4 different rectangles with text, each time choosing a different rotation value:: This script searches for text and marks it:: This script uses `Page.get_text("words")` to look for a string, handed in via cli parameter. This method separates a page's text into "words" using spaces and line breaks as delimiters. Further remarks: This script will take a document filename and generate a text file from all of its text. To analyze the characteristics of text in a PDF use this elementary script as a starting point: Upper or lower case characters are treated equal Use `sort` parameter of :meth:`Page.get_text`. It will sort the output from top-left to bottom-right (ignored for XHTML, HTML and XML output). Use the `fitz` module in CLI: `python -m fitz gettext ...`, which produces a text file where text has been re-arranged in layout-preserving mode. Many options are available to control the output. With this method, only the **number of lines** will be controlled to not go beyond page height. Surplus lines will not be written and the number of actual lines will be returned. The calculation uses a line height calculated from the fontsize and 36 points (0.5 inches) as bottom margin. Word hyphenation at line ends is detected and resolved You can also use the above mentioned `script <https://github.com/pymupdf/PyMuPDF/wiki/How-to-extract-text-from-a-rectangle>`_ with your modifications. You can use **anything** to mark the word: 'Underline', 'Highlight', 'StrikeThrough' or 'Square' annotations, etc. You have many options to rectify this -- see chapter :ref:`Appendix2`. Among them are: all text can be arbitrarily "morphed", i.e. its appearance can be changed via a :ref:`Matrix`, to achieve effects like scaling, shearing or mirroring, already present somewhere in **this or another** PDF, or be a **built-in** font. choose text characteristics like bold, italic, font size, font color, etc. choose the font, including built-in fonts and fonts that are available as files choose whether text should be put in foreground (overlay existing content), either as simple line-oriented output starting at a certain point, footer line header line independently from morphing and in addition to that, text can be rotated by integer multiples of 90 degrees. or fitting text in a box provided as a rectangle, in which case text alignment choices are also available, original text position the text in multiple ways: provided as a file, via :ref:`Font` (then use :attr:`Font.buffer`) Project-Id-Version: PyMuPDF 1.23.0rc1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-08-16 14:20+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Suzan Sanver <suzan.sanver@dijipiji.com>
Language: ja
Language-Team: ja <suzan.sanver@dijipiji.com>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.10.3
 ããã§ã®ãäºæ¸¬å¯è½ãã¨ã¯ãæ¬¡ã®ãããªæå³ã§ãï¼ :meth:`Page.insert_font` - ãã¼ã¸ã«ãã©ã³ããã¤ã³ã¹ãã¼ã«ãã¦å¾ã§åç§ã§ããããã«ãã¾ãããã®çµæã¯ã :meth:`Document.get_page_fonts` ã®åºåã«åæ ããã¾ãããã©ã³ãã¯ä»¥ä¸ã®æ¹æ³ã§æä¾ã§ãã¾ãï¼ :meth:`Page.insert_text`  - ãã­ã¹ãã®è¡ãæ¸ãè¾¼ã¿ã¾ããåé¨çã«ã¯ :meth:`Shape.insert_text` ãä½¿ç¨ãã¾ãã :meth:`Page.insert_textbox`  - æå®ãããç©å½¢ã«ãã­ã¹ãããã£ããããã¾ããããã§ã¯ããã­ã¹ãã®æ´åæ©è½ï¼å·¦æããå³æããä¸­å¤®æããä¸¡ç«¯æãï¼ãé¸æã§ãã¾ããã¾ãããã­ã¹ããå®éã«ãã£ãããããã©ããã®å¶å¾¡ãã§ãã¾ããåé¨çã«ã¯ :meth:`Shape.insert_textbox` ãä½¿ç¨ãã¾ãã ä»¥ä¸ã®ãã¹ã¦ã¯ãããããã®åºæ¬çãª :ref:`Page` ã:ref:`Shape` ã¡ã½ããã«ãã£ã¦æä¾ããã¦ãã¾ãã ããã§ç¤ºããããã«ãå¤§æå­ã¨å°æå­ã¯åºå¥ããã¾ããã`mark_word` é¢æ°ã§ `lower()` ã¡ã½ããï¼ã¾ãã¯æ­£è¦è¡¨ç¾ï¼ãä½¿ç¨ãããã¨ã§å¤æ´ã§ãã¾ãã ãã­ã¹ãæ¿å¥ã®ä¸¡æ¹ã®æ¹æ³ã¯ãå¿è¦ã«å¿ãã¦ãã©ã³ããèªåçã«ã¤ã³ã¹ãã¼ã«ãã¾ãã ãããã :meth:`Page.get_text` ã®ãdictã/ãrawdictããªãã·ã§ã³ãä½¿ç¨ãããã­ã¹ãæ½åºã§ã¯ãxè»¸ã«å¯¾ãã¦ã¼ã­ã§ãªãè§åº¦ã®ãã­ã¹ããè¿ãããå ´åãããã¾ããããã¯ãè¡ã®è¾æ¸ã® "dir" ã­ã¼ã®å¤ã«ãã£ã¦ç¤ºããã¾ãï¼ããã¯ãã®è§åº¦ã«å¯¾ãã  `(cosine, sine)`  ã®ã¿ãã«ã§ãã `line["dir"] != (1, 0)`  ã§ããã°ããã¹ã¦ã®ã¹ãã³ã®ãã­ã¹ãã¯ (åã) è§åº¦ != 0 ã«ãã£ã¦åè»¢ãã¦ãã¾ãã ãã ããä»ã«ãé¸æè¢ãããã¾ã:: ä¸è¨ã®è¨è¿°ã«ããããã©ã³ãåãhelvãã¯èªåçã«Helveticaã®ã­ã·ã¢èªããªã¢ã³ãã«æ¥ç¶ããã¾ãããã®ãã©ã³ãåãä½¿ç¨ãã¦ä»¥éã®ãã­ã¹ãæ¿å¥ã§ã¯ãã­ã·ã¢èªã®Helveticaã¨ã³ã³ã¼ãã£ã³ã°ãä½¿ç¨ããã¾ãã åã­ã¼ã¯ã¼ãã®å¾ã«ã¯ãã®å¤ãç¶ãã¾ãããããã®éã«ä»ã®ãã­ã¹ãã¯ããã¾ããã Page.get_text("words")ãä½¿ã£ã¦åèªã®ãªã¹ããæ½åºãã¾ããåã¢ã¤ãã ã«ã¯ä½ç½®æå ±ãå«ã¾ãã¦ãã¾ãããããä½¿ç¨ãã¦ç¹å®ã®åè§å½¢ã«å«ã¾ãããã­ã¹ããæ±ºå®ãã¾ãã Page.get_text("blocks")ãä½¿ã£ã¦ãã­ã¹ããã­ãã¯ã®ãªã¹ãã¨ãã¦æ½åºãã¾ãããªã¹ãã®åã¢ã¤ãã ã«ã¯ãã­ã¹ãã®ä½ç½®æå ±ãå«ã¾ãã¦ãããä¾¿å©ãªèª­ã¿é ãç¢ºç«ããã®ã«ä½¿ç¨ã§ãã¾ãã ãã­ã¹ããHTMLå½¢å¼ã§æ½åºããHTMLãã­ã¥ã¡ã³ãã¨ãã¦ä¿å­ãããã¨ã§ãä»»æã®ãã©ã¦ã¶ã§è¡¨ç¤ºã§ããããã«ãã¾ãã ãããã£ã¦ããã®ãããªãã¼ã¸é åããè¡¨ã®ãã¼ã¿ãæ½åºããã«ã¯ãã¾ãè¡¨ã®é åï¼ã¤ã¾ãããã®å¢çããã¯ã¹ï¼ãç¹å®ããæ¹æ³ãè¦ã¤ããå¿è¦ãããããã®å¾ï¼1ï¼ã°ã©ãã£ã«ã«ã«è¡¨ã¨åã®å¢çãç¤ºããï¼2ï¼ãã®æå ±ã«åºã¥ãã¦ãã­ã¹ããæ½åºããå¿è¦ãããã¾ãã ä¾ã¨ãã¦ãä»¥ä¸ã®5ã¤ã®ã­ã¼ã¨å¤ã®ãã¢ãæ­£ããè­å¥ããã¾ã:: ä»¥ä¸ã¯ããã®ããã¥ã¢ã«ã®ãã¼ã¸ã®ä¸é¨ã®ä¾ã¹ããããã§ããMuPDFããæ¤ç´¢æå­åã¨ãã¦ä½¿ç¨ããã¦ãã¾ããæ³¨æï¼ãMuPDFããå«ããã¹ã¦ã®æå­åãå®å¨ã«ã¢ã³ãã¼ã©ã¤ã³ã§å¼ããã¦ãããã¨ã«æ³¨æãã¦ãã ããï¼æ¤ç´¢æå­åã ãã§ãªãï¼ã ä»¥ä¸ã¯å¥ã®ä¾ã§ãã4ã¤ã®ç°ãªãåè»¢ãªãã·ã§ã³ãä½¿ç¨ãã¦ãã­ã¹ãæå­åãæ¿å¥ããããã«ãããæãçµæãå¾ãããã«ã©ã®ããã«ãã­ã¹ãæ¿å¥ãã¤ã³ããé¸æãã¹ãããèª¬æãã¦ãã¾ã:: ä»¥ä¸ã¯PDFãã¼ã¸ã¨ã¹ã¯ãªããã®åºåã§ãã ãã­ã¥ã¡ã³ãããè¡¨ã®åå®¹ãæ½åºããæ¹æ³ ãã©ã³ãã®ç¹æ§ãåæããæ¹æ³ ãã¼ã¸ããã­ã¼ã¨å¤ã®ãã¢ãæ½åºããæ¹æ³ åè§å½¢åã®ãã­ã¹ããæ½åºããæ¹æ³ èªç¶ãªèª­ã¿é ã§ãã­ã¹ããæ½åºããæ¹æ³ ãã¹ã¦ã®ãã­ã¥ã¡ã³ããã­ã¹ããæ½åºããæ¹æ³ ãã­ã¹ãããã¯ã¹ã®å¡ãã¤ã¶ãæ¹ ãã­ã¹ãã®æ¿å¥æ¹æ³ æ½åºãããã­ã¹ãããã¼ã¯ããæ¹æ³ éæ°´å¹³ãã­ã¹ãããã¼ã¯ããæ¹æ³ æ¤ç´¢ãããã­ã¹ãããã¼ã¯ããæ¹æ³ éæ¨æºã¨ã³ã³ã¼ãã£ã³ã°ã®ä½¿ç¨æ¹æ³ ãã­ã¹ãè¡ãæ¸ãæ¹æ³ ãã ããçµã¿è¾¼ã¿ã®ãã©ã³ãã«ã¯ãè¡ã®å¹ãäºåã«è¨ç®ããæ¹æ³ãããã¾ãã :meth:`get_text_length` ãåç§ãã¦ãã ããã æå­åãè¦ã¤ãã£ãå ´åãæ¤ç´¢æå­åã ãã§ãªãããã®æå­åãå«ãå®å¨ãªåèªããã¼ã¯ããã¾ãï¼ã¢ã³ãã¼ã©ã¤ã³ãå¼ããã¾ãï¼ã ãããã¼ã¸ã®ã¬ã¤ã¢ã¦ããããç¨åº¦äºæ¸¬å¯è½ã§ããã°ãæ­£è¦è¡¨ç¾ãä½¿ç¨ããã«ãç¹å®ã®ã­ã¼ã¯ã¼ãã«å¯¾ããå¤ãè¿éãã¤ç°¡åã«è¦ã¤ããæ¹æ³ãããã¾ãã `ä»¥ä¸ã®ä¾ã®ã¹ã¯ãªãã <https://github.com/pymupdf/PyMuPDF-Utilities/tree/master/text-extraction/lookup-keywords.py>`_ ãåç§ãã¦ãã ããã ãã©ã³ãåããããã«å¤æ´ãããã¨ã§ãåããã¼ã¹ãã©ã³ãã®åããã¼ã¸ä¸ã§ã¨ã³ã³ã¼ãã£ã³ã°ã®ãæ··åããå®ç¾ãããã¨ãã§ãã¾ãã ææ¸ã§è¡¨ãè¦ãå ´åãéå¸¸ã¯åãè¾¼ã¾ããExcelãªã©ã®è­å¥å¯è½ãªãªãã¸ã§ã¯ãã®ãããªãã®ã§ã¯ããã¾ãããéå¸¸ãåãªãéå¸¸ã®æ¨æºãã­ã¹ãã§ãè¡¨ã®ãã¼ã¿ã¨ãã¦è¡¨ç¤ºãããããã«ãã©ã¼ãããããã¦ãã¾ãã ä¸åº¦ã«å®å¨ãªè¡ã¾ãã¯ãã®ä¸é¨ã®ã¹ãã³ããã¼ã¯ãããå ´åã¯ãä»¥ä¸ã®ã¹ãããããä½¿ç¨ãã¦ãã ããï¼v1.18.10ä»¥éã§åä½ãã¾ãï¼ è¡ã®å¹ã¯ç¡è¦ããã¾ããè¡ã®ä½å°é¨åã¯åã«è¦ããªããªãã¾ãã Method :meth:`Page.find_tables` ã¯ãé«ãè¡¨æ¤åºç²¾åº¦ãåãã¦ããã¹ã¦ãããªãã®ããã«è¡ãã¾ãããã®å¤§ããªå©ç¹ã¯ãå¤é¨ã©ã¤ãã©ãªã®ä¾å­é¢ä¿ããªããã¨ãäººå·¥ç¥è½ãæ©æ¢°å­¦ç¿æè¡ãä½¿ç¨ããå¿è¦ããªããã¨ã§ããã¾ãããã¼ã¿åæã®ããã®Pythonããã±ã¼ã¸ã§ãã `pandas <https://pypi.org/project/pandas/>`_ ã®ããã®çµ±åãããã¤ã³ã¿ã¼ãã§ã¼ã¹ãæä¾ãã¾ãã PDFã®ãã­ã¹ãæ½åºã«ããããåé¡ã®1ã¤ã¯ããã­ã¹ããç¹å®ã®èª­ã¿é ã«è¡¨ç¤ºãããªããã¨ã§ãã ãã¼ã¸ã«ããã¤ãã®ãã­ã¹ãè¡ãåºåããæ¹æ³:: æ¨æºçãªç¶æ³ãã«ãã¼ããä¾ã® `Jupyter <https://github.com/pymupdf/PyMuPDF-Utilities/tree/master/table-analysis>`_ ãã¼ãããã¯ããè¦§ããã ããã°å¹¸ãã§ããããã«ã¯ã1ã¤ã®ãã¼ã¸ã«è¤æ°ã®è¡¨ãè¤æ°ã®ãã¼ã¸ã«ã¾ãããè¡¨ã®æ­çãçµåãããªã©ã®ç¶æ³ãå«ã¾ãã¦ãã¾ãã PyMuPDFã«ã¯ãããã¤ãã®æ¹æ³ã§èª­ã¿é ãåç¢ºç«ããããåã®ã¬ã¤ã¢ã¦ãã«è¿ãå½¢ã§åçæããææ®µãããã¾ãï¼ PyMuPDFã¯ãä»¥ä¸ã®æ©è½ãåãã¦æ°ããã¾ãã¯æ¢å­ã®PDFãã¼ã¸ã«ãã­ã¹ããæ¿å¥ããæ¹æ³ãæä¾ãã¦ãã¾ãï¼ è¿ãå¤ã¯ :ref:`Quad` ãªãã¸ã§ã¯ãã®ãªã¹ãã«ãªãå ´åããããããã«ããè»¸ã«å¯¾ãã¦å¹³è¡ã§ãªããã­ã¹ããæ­£ç¢ºã«ä½ç½®ä»ãããã¨ãã§ãã¾ãããã¼ã¸ã®åè»¢ãã¼ã­ã§ãªãå ´åã«ã¯ã :ref:`Quad` ã®åºåãä½¿ç¨ãããã¨ãæ¨å¥¨ããã¾ãã ä»¥ä¸ã®2ã¤ã®ã»ã¯ã·ã§ã³ãè¦ã¦ãä¾ã¨è©³ç´°ãªèª¬æããè¦§ãã ããã ä¸è¨ã§ã¯ããã¤ãã®ããã©ã«ãå¤ãä½¿ç¨ããã¾ããï¼ãã©ã³ããHelveticaãããã©ã³ããµã¤ãº11ããã­ã¹ãã®éç½®ã¯ãå·¦å¯ããã§ããçµæã¯ä»¥ä¸ã®ããã«ãªãã¾ãã v1.14ä»¥éãMuPDFã§ã¯ :data:`Base14_Fonts` ã®ã®ãªã·ã£èªããã³ã­ã·ã¢èªã®ã¨ã³ã³ã¼ãã£ã³ã°ããªã¢ã³ããè¨±å¯ããã¦ãã¾ããPyMuPDFã§ã¯ãããã¯è¿½å ã®ã¨ã³ã³ã¼ãã£ã³ã°å¼æ°ãä»ãã¦ãµãã¼ãããã¦ãã¾ããããã¯å®éã«ã¯HelveticaãTimes-RomanãCourierï¼ããã³ãããã®å¤ªå­/æä½å½¢å¼ï¼ããã³ASCIIã³ã¼ãç¯å²å¤ã®æå­ã«ã®ã¿å½±é¿ãã¾ããä»ã®å ´æã§ã¯ããã®å¼æ°ã¯ç¡è¦ããã¾ããä»¥ä¸ã¯ãæ¨æºãã©ã³ãHelveticaã§ã­ã·ã¢èªã®ã¨ã³ã³ã¼ãã£ã³ã°ãè¦æ±ããæ¹æ³ã§ã:: ãã­ã¹ã ãã ãããã®ã¡ã½ããã«ãã£ã¦è¿ããããbboxesãã¯åè§å½¢ã®ã¿ã§ãããã¯ã¯ããã§ã¯ããã¾ããããããã£ã¦ãã¹ãã³ãã­ã¹ããæ­£ãããã¼ã¯ããã«ã¯ãè¡ã¨ã¹ãã³ã®è¾æ¸ã«å«ã¾ãããã¼ã¿ããã¯ã¯ãããåå¾©ããå¿è¦ãããã¾ããä»¥ä¸ã®ã¦ã¼ãã£ãªãã£é¢æ°ãä½¿ç¨ãã¦ãã ããï¼v1.18.9ã§æ°ããè¿½å ããã¾ããï¼:: ä¸è¨ã® `spans` å¼æ°ã¯ã`line["spans"]` ã®ä»»æã®é¨åãªã¹ããæå®ã§ãã¾ããä¸è¨ã®ä¾ã§ã¯ã2çªç®ããæå¾ãã2çªç®ã®ã¹ãã³ããã¼ã¯ããã¾ããçç¥ããã¨ãå®å¨ãªè¡ãåå¾ããã¾ã å¤ã®å¢çããã¯ã¹ã®ä¸ç«¯ã¯ãã­ã¼ã¯ã¼ãã®å¢çããã¯ã¹ãããä¸ã«ããã¾ããã ãã­ã¥ã¡ã³ãã¯ã:ref:`ãµãã¼ãããã¦ãã <Supported_File_Types>` ä»»æã®ã¿ã¤ãã®ãã®ãä½¿ç¨ã§ãã¾ãã åºåã¯ãã­ã¥ã¡ã³ãåã§ã³ã¼ãåãããéãã®ãã¬ã¼ã³ãã­ã¹ãã«ãªãã¾ããè¦æ ããæ´ããããã®ç¹å¥ãªåªåã¯è¡ããã¾ãããç¹ã«PDFã®å ´åãéå¸¸ã®èª­ã¿é ã«ãªããªãåºåãäºæãã¬æ¹è¡ãªã©ãçºçããããããã¾ããã åã®ã»ã¯ã·ã§ã³ã§ã¯ããã­ã¹ãæ¤ç´¢ã«ãã£ã¦æ¤åºãããéæ°´å¹³ãã­ã¹ãã®ãã¼ã¯ã®ä¾ãæ¢ã«ç¤ºããã¦ãã¾ãã çµæã¯ä»¥ä¸ã®ããã«ãªãã¾ãï¼ çµæã¯ä»¥ä¸ã®éãã§ãã ãã®ã¹ã¯ãªããã¯ã³ãã³ãã©ã¤ã³ãã¼ã«ã¨ãã¦æ©è½ãããã­ã¥ã¡ã³ãã®ãã¡ã¤ã«åããã©ã¡ã¼ã¿ã¨ãã¦åãåãã¾ããã¹ã¯ãªããã®ãã£ã¬ã¯ããªã«ãfilename.txtãã¨ããååã®ãã­ã¹ããã¡ã¤ã«ãçæããã¾ãããã¼ã¸ã®ãã­ã¹ãã¯ãã©ã¼ã ãã£ã¼ãæå­ã§åºåããã¾ãã æ¤ç´¢æå­åã«ã¯ç©ºç½ãå«ãããã¨ãã§ããè¡ãã¾ãããã¨ãã§ãã¾ãã æ¤ç´¢æå­åã«ã¯ã¹ãã¼ã¹ãä»ã®ç©ºç½æå­ãå«ãããã¨ã¯ã§ãã¾ããã ä¸è¨ã®ã¹ããããã¯å®éã«PDFåã«Helveticaãã©ã³ãã®3ã¤ã®ç°ãªãã³ãã¼ãçæãã¾ããåã³ãã¼ã¯æ­£ããå¤§æå­å°æå­ã®ã¹ãã«ï¼"helv"ï¼ãä½¿ç¨ãã¦ä¸æã«è­å¥ãããåç§ãå¯è½ã§ãã ãã®ããã«å¤æ´ããããã¼ã¸ããæ½åºããããã­ã¹ãã®ã·ã¼ã±ã³ã¹ã¯æ¬¡ã®ããã«ãªãã¾ãï¼ æå¹ãªã¨ã³ã³ã¼ãã£ã³ã°å¤ã¯ãTEXT_ENCODING_LATINï¼0ï¼ãTEXT_ENCODING_GREEKï¼1ï¼ãTEXT_ENCODING_CYRILLICï¼2ãã­ã·ã¢èªï¼ã§ãããããã©ã«ãã¯Latinã§ããã¨ã³ã³ã¼ãã£ã³ã°ã¯ããã¹ã¦ã®é¢é£ãããã©ã³ãããã³ãã­ã¹ãæ¿å¥ã¡ã½ããã§æå®ã§ãã¾ãã ä»ã®å¶ç´ã¯ããã¾ããï¼ãã¼ã¸ã®ã¬ã¤ã¢ã¦ããåºå®ããã¦ãããã©ããã¯åãã¾ãããããã­ã¹ãã¯1ã¤ã®æå­åã¨ãã¦ä¿å­ããã¦ããå¯è½æ§ãããã¾ããã­ã¼ã¨å¤ã¯ãäºãã«ä»»æã®è·é¢ãæã¤ããããã¾ããã ä¸éã¯ããã¾ããããã¹ã¦ã®åºç¾ãæ¤åºãã¾ãã ãã¼ã¸ä¸ã§ä»»æã®ãã­ã¹ããæ¤ç´¢ããããã®æ¨æºçãªæ¤ç´¢æ©è½ãããã¾ã:  :meth:`Page.search_for` ã§ããããã¯ãè¦ã¤ãã£ããã­ã¹ããå²ã :ref:`Rect` ãªãã¸ã§ã¯ãã®ãªã¹ããè¿ãã¾ãããããã®åè§å½¢ã¯ãè¦ã¤ãã£ããã­ã¹ããç®ã«è¦ããããã«ãã¼ã¯ããããã«èªåçã«æ³¨éãæ¿å¥ããã®ã«ä½¿ç¨ã§ãã¾ãã ç¾å¨ï¼v1.18.0ï¼ã§ã¯ããããå®ç¾ããããã®è¤æ°ã®æ¹æ³ãããã¾ãããã®ãããç§ãã¡ã¯ `PyMuPDF-Utilities <https://github.com/pymupdf/PyMuPDF-Utilities/tree/master/textbox-extraction>`_ ãªãã¸ããªã«ããã®ç¹å®ã®ãããã¯ã«å¯¾å¿ãããã©ã«ããä½æãã¾ããã ããã¯ãç·ãåè§å½¢ãã¾ãã¯ãã®ä»ã®ãµãã¼ããã¯ãã«ã°ã©ãã£ãã¯ã®å­å¨ã¾ãã¯ä¸å¨ãªã©ã®è©³ç´°ã«ä¾å­ãããããéå¸¸ã«è¤éãªã¿ã¹ã¯ã«ãªãå¯è½æ§ãããã¾ãã ããã¯PDFã®ä½æèï¼ã½ããã¦ã§ã¢ã¾ãã¯äººéï¼ã®è²¬ä»»ã§ãããã¨ãã°ããã¼ã¸ãããã¼ã¯ãã­ã¥ã¡ã³ããä½æãããå¾ã®å¥ã®ã¹ãããã§æ¿å¥ãããå¯è½æ§ãããã¾ãããã®ãããªå ´åããããã¼ãã­ã¹ãã¯ãã¼ã¸ãã­ã¹ãã®æ½åºã®æå¾ã«è¡¨ç¤ºããããã¨ãããã¾ãï¼ãã ããPDFãã¥ã¼ã¢ã½ããã¦ã§ã¢ã§ã¯æ­£ããè¡¨ç¤ºããã¾ãï¼ãä»¥ä¸ã®ã¹ããããã¯ãæ¢å­ã®PDFã«ããã¤ãã®ãããã¼ã¨ããã¿ã¼ã®è¡ãè¿½å ãã¾ã:: ãããçµæã§ãã ãã®æ¹æ³ã«ã¯å©ç¹ã¨æ¬ ç¹ãããã¾ããå©ç¹ã¯æ¬¡ã®ã¨ããã§ãï¼ ãã®ã¹ã¯ãªããã¯ãç°ãªãåè»¢å¤ãé¸æãã¦ã4ã¤ã®ç°ãªãé·æ¹å½¢ã«ãã­ã¹ããå¡ãã¤ã¶ãã¾ãã ãã®ã¹ã¯ãªããã¯ãã­ã¹ããæ¤ç´¢ãã¦ãã¼ã¯ãã¾ã:: ãã®ã¹ã¯ãªããã¯ãcliãã©ã¡ã¼ã¿ã¼ãä»ãã¦æ¸¡ãããæå­åãæ¤ç´¢ããããã«Page.get_text("words")ãä½¿ç¨ãã¾ãããã®æ¹æ³ã§ã¯ããã¼ã¸ã®ãã­ã¹ããã¹ãã¼ã¹ã¨æ¹è¡ãåºåãã¨ãã¦ãåèªãã«åå²ããã¾ãããããªãæ³¨éï¼ ãã®ã¹ã¯ãªããã¯ããã­ã¥ã¡ã³ãã®ãã¡ã¤ã«åãåãåãããã®ãã­ã¹ããããã­ã¹ããã¡ã¤ã«ãçæãã¾ãã PDFåã®ãã­ã¹ãã®ç¹æ§ãåæããã«ã¯ãä»¥ä¸ã®åæ­©çãªã¹ã¯ãªãããåºçºç¹ã¨ãã¦ä½¿ç¨ãã¾ã:: å¤§æå­ã¨å°æå­ã¯åãããã«æ±ããã¾ãã :meth:`Page.get_text` ã® `sort` ãã©ã¡ã¼ã¿ã¼ãä½¿ç¨ãã¾ããããã«ãããåºåãå·¦ä¸ããå³ä¸ã«åãã£ã¦ã½ã¼ãããã¾ãï¼XHTMLãHTMLãXMLåºåã«ã¯ç¡å¹ã§ãï¼ã CLIã§fitzã¢ã¸ã¥ã¼ã«ãä½¿ç¨ãã¾ãï¼ `python -m fitz gettext ...` ãããã«ããããã­ã¹ããã¬ã¤ã¢ã¦ããä¿æããã¢ã¼ãã§åéç½®ããããã­ã¹ããã¡ã¤ã«ãçæããã¾ããåºåãå¶å¾¡ããããã®å¤ãã®ãªãã·ã§ã³ãå©ç¨å¯è½ã§ãã ãã®æ¹æ³ã§ã¯ããã¼ã¸ã®é«ããè¶ããªãããã«è¡ã®æ°ã ããå¶å¾¡ãã¾ããä½å°ã®è¡ã¯æ¸ãè¾¼ã¾ãããå®éã®è¡æ°ãè¿ããã¾ããè¨ç®ã«ã¯ããã©ã³ããµã¤ãºã¨36ãã¤ã³ãï¼0.5ã¤ã³ãï¼ã®ããã ãã¼ã¸ã³ããè¨ç®ãããè¡ã®é«ããä½¿ç¨ããã¾ãã è¡æ«ã§ã®åèªã®ãã¤ããã¼ã·ã§ã³ãæ¤åºãããè§£æ±ºããã¾ãã ã¾ããä¸è¨ã® `ã¹ã¯ãªãã <https://github.com/pymupdf/PyMuPDF/wiki/How-to-extract-text-from-a-rectangle>`_ ãèªåã®å¤æ´ã¨ã¨ãã«ä½¿ç¨ãããã¨ãã§ãã¾ãã åèªããã¼ã¯ããããã«ä½ãä½¿ç¨ãã¦ãæ§ãã¾ããï¼ãã¢ã³ãã¼ã©ã¤ã³ããããã¤ã©ã¤ããããåãæ¶ãç·ãããåè§ãã®æ³¨éãªã©ãããã¾ãã ãããä¿®æ­£ããããã®å¤ãã®ãªãã·ã§ã³ãããã¾ããè©³ç´°ã¯ :ref:`Appendix2` ç« ãåãè¾¼ã¿ãã¡ã¤ã«ã«é¢ããèæ®äºé ããåç§ãã¦ãã ãããä»¥ä¸ã®æ¹æ³ãããã¾ãï¼ ãã­ã¹ãã¯ä»»æã«ãå¤å½¢ãããããã¨ãã§ãã¾ããã¤ã¾ããè¡åãä½¿ç¨ãã¦æ¡å¤§ãããæ­ãåè»¢ãªã©ã®å¹æãå¾ããã¨ãã§ãã¾ãã æ¢ã«ãã®PDFã¾ãã¯å¥ã®PDFã®ã©ããã«å­å¨ããã çµã¿è¾¼ã¿ãã©ã³ãã§ããã ãã­ã¹ãã®ç¹æ§ã®é¸æï¼å¤ªå­ãæä½ããã©ã³ããµã¤ãºããã©ã³ãã«ã©ã¼ãªã©ããã­ã¹ãã®ç¹æ§ãé¸æã§ãã¾ãã ãã©ã³ãã®é¸æï¼çµã¿è¾¼ã¿ã®ãã©ã³ãããã¡ã¤ã«ã¨ãã¦å©ç¨å¯è½ãªãã©ã³ããé¸æã§ãã¾ãã ãã­ã¹ããåé¢ã«éç½®ãããé¸æã§ãã¾ãï¼æ¢å­ã®ã³ã³ãã³ãããªã¼ãã¼ã¬ã¤ãã¾ãï¼ã ç¹å®ã®ãã¤ã³ããèµ·ç¹ã¨ãã¦åç´ãªè¡æåã®åºåã¨ãã¦éç½®ãããã¨ãã§ãã¾ãã  ããã¿ã¼ã©ã¤ã³ ãããã¼ã©ã¤ã³ å¤å½¢ã¨ã¯å¥ã«ããã­ã¹ãã90åº¦ã®æ´æ°åã§åè»¢ããããã¨ãã§ãã¾ãã ããã¯ã¹ã«ãã­ã¹ãããã£ãããããå ´åã¯ããã­ã¹ãã®éç½®ãé¸æãããã¨ãã§ãã¾ãããã®å ´åããã­ã¹ãã®æ´åãªãã·ã§ã³ãå©ç¨ã§ãã¾ãã åã®ãã­ã¹ã ãã­ã¹ãã®éç½®æ¹æ³ï¼ ãã¡ã¤ã«ã¨ãã¦æä¾ããã :ref:`Font` ãä½¿ç¨ãã¦æä¾ããï¼ãã®å ´åã :attr:`Font.buffer` ãä½¿ç¨ãã¾ãï¼ã 