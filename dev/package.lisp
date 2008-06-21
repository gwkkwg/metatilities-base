(in-package #:common-lisp-user)

(defpackage #:metabang.utilities
  (:nicknames #:metatilities)
  (:use #:common-lisp)

  ;; just a little bit of mop
  (:import-from #+allegro          #:mop
		#+clisp            #:clos
		#+ecl              #:clos
		#+lispworks        #:clos
		#+(or mcl openmcl) #:ccl
		#+cmu              #:clos-mop
		#+sbcl             #:sb-mop
		#:class-direct-subclasses
		#:class-precedence-list
		#:class-finalized-p
		#:finalize-inheritance)
  (:export 
   #:class-direct-subclasses
   #:class-precedence-list
   #:class-finalized-p
   #:finalize-inheritance)
   
  #+asdf
  (:import-from #:asdf
                #:load-op #:compile-op #:test-op 
                #:operate #:oos)
  #+asdf
  (:export
   #:load-op #:compile-op #:test-op 
   #:operate #:oos)
  
  #+(or openmcl digitool)               ; ??? I think this is the right thing...
  (:shadow #:line #:copy-file
           #:lock-owner #:lock-name
           #:selected? #:whitespacep)
  
  (:intern
   #:depth)

  (:export
   #:copy-file)

  (:export 
   #:neq)
  
  #-(or allegro clisp)
  (:import-from #+lispworks #:mp
                #+(or openmcl digitool)       #:ccl
                #+cmu       #:system
                #+sbcl      #:sb-sys

                #:without-interrupts)
    
  (:export
   #:apply-if-exists)

  (:export
   #:defclass-property
   #:deprecated
   #:once-only
   #:with-variables
   #:eval-always
   #:with-atomic-execution
   #:handler-bind*
   #:with-stream-from-specifier
   #:relative-pathname
   #:directory-pathname-p
   #:ensure-directory-pathname
   #:with-input
   #:with-output
   #:map-lines
   #:map-forms
   #:collect-lines
   #:collect-forms
   #:map-matching-files
   #:collect-matching-files)
  
  (:export
   #:defclass-brief 
   #:defclass*
   #:defcondition)
      
  (:export 
   #:copy-array
   #:linearize-array
   #:maparray! 
   #:maparray
   #:array-row
   #:group)
  
  (:export 
   #:element
   #:element-type
   #:filter
   #:parent
   #:tag
   #:find-or-create-class
   #:size
   #:root
   #:next-element
   #:total-size)
    
  (:export #:without-interrupts)
  
  (:export 
   #:make-allocatable
   #:allocate
   #:deallocate
   #:allocation-status 
   #:with-object
   #:with-objects
   #:reallocate-instance)
  
  ;; views-and-windows
  (:export
   #:update-dialog-ui
   #:dialog-item-value 
   
   #:help-text
   
   #:note-view-settings-changed
   
   #:view-scale
   #:view-x/view-y->x/y
   #:view-rect->rect
   #:x/y->view-x/view-y
   #:view-x/view-y->point
   #:distance-x/distance-y->x/y
   #:x/y->distance-x/distance-y
   #:adjust-point-for-scaling
   #:scale-x
   #:scale-y
   #:view-x/view-y->point
   
   #:view-requiring-cleanup-mixin
   #:clean-up-view
   
   #:redraw
   
   #:begin-new-selection
   #:end-new-selection
   
   #:relative-view-position
   #:selected-items
   #:empty-selections!
   #:can-extend-selection-p
   #:can-add-to-selection-p
   #:item-selected-p
   #:anything-selected-p
   #:first-selected-item
   #:select-item
   #:unselect-item
   #:unselect-all)
  
  ;; utilities
  (:export
   #:firstn
   #:mapappend
   #:find-all
   #:find-all-if
   #:find-all-if-not
   #:partition
   #:tree-find
   #:tree-find-if
   #:tree-remove-if
   #:tree-map
   #:push-end
   
   #:compact-array
   #:linearize-array
   #:copy-array
   #:maparray
   
   #:nmerge-list
   #:circular-list
   #:make-initialized-array
   #:fixnump
   #:object->string
   #:float->integer
   #:sort-using-list-order
   #:unused-variables
   #:lambda-list->args
   #:car-safe
   #:cdr-safe
   
   #:curry
   #:curry-after
   #:compose
   #:conjoin
   #:disjoin
   
   #:argmax
   #:argmin
   #:best-item ; see also u:minimize, u:reduce-if
   #:singleton-or-list
   #:very-small-number-p
   #:+very-small-number+
   #:set-equal
   #:remove-leading-quote
   
   #:nth-elt-of-cross-product
   #:nth-elt-of-cross-product-as-multiple-values
   
   #:evaluate-argument-list
   
   #:constant-expression-p
   #:inspect-hyaline
   
   #:make-sorter
   
   #:cleanup-parsed-parameter
   #:convert-clauses-into-lists
   #:convert-clauses-into-lists*
   #:add-class-if-necessary
   #:add-classes-if-necessary
   #:length-at-least-p
   #:length-at-most-p
   )
  
  ;; notifications
  (:export 
   #:basic-notification
   #:register
   #:unregister
   #:unregister-all
   #:post-notification
   #:notify
   #:with-registration
   #:still-cares-about-notification-p)
  
  (:export 
   #:spy
   #:spyx)
  
  (:export
   #:binary-search
   #:graph-search)
  
  ;; macros
  (:export
   #:muffle-redefinition-warnings
   #:nyi
   #:deprecated
   #:make-obsolete
   #:defsubst
   #:named-lambda
   #:deletef
   #:removef
   #:circular-list
   
   #:doplist
   #:group
   #:gensym0
   #:with-conditional-open-file
   #:with-conditional-open-files
   #:assert*
   #:maxf
   #:minf
   #:multf
   #:incf-assoc
   #:some*
   #:handler-case-if
   
   #:gensym*
   #:with-unique-names
   #:rebinding
   
   #:\\                           ; yes, this is actually the name of a macro. ---L
   
   #:hcase
   
   #:dovect
   #:ensure-type
   #:with-slot-bindings
   
   #:defun*
   #:defmethod*
   #:*add-check-types*
   #:*optimizations-to-ignore*
   
   #:delegates-to
   
   #:funcall-if
   
   #:*file-if-exists*
   #:with-new-file)
  
  ;; graham
  (:export
   #:with-gensyms
   #:allf
   #:nilf
   #:tf
   #:toggle!                       ; renamed toggle to toggle!
   #:filter-values
   #:with-array
   #:with-matrix
   #:with-struct
   #:match
   #:if-match
   
   #:most
   #:best
   #:mostn
   
   #:map0-n
   #:map1-n
   #:mapa-b
   #:map->
   #:mapcars
   
   #:fn
   #:compose
   
   #:concf)
  
  ;; files
  (:export
   #:invalid-stream-specifier-error

   #:pathname-samep
   #:file-to-list
   #:file-newer-than-file-p
   #:conjure-up-filename
   #:unique-file-name-from-date
   #:pretty-namestring-from-date
   #:eos-namestring-from-date
   #:short-eos-namestring-from-date
   #:rename-file-if-present
   #:uniquify-file-name
   #:remove-illegal-filename-characters
   #:shorten-filename-for-os
   #:map-files
   #:map-forms-in-file
   #:map-lines-in-file 
   #:map-lines
   #:next-line
   #:file-package
   #:touch-file
   #:ensure-filename-safe-for-os
   #:pathname-name+type
   #:physical-pathname-directory-separator
   #:delete-directory
   #:directory-name-p)
  
  ;; dates and times
  (:export
   #:day->string 
   
   #:month->string
   #:string->month
   
   #:print-date
   #:date-string 
   #:date-string-brief 
   #:print-time 
   #:print-universal-time
   #:time-string
   #:time-string-with-no-colons
   #:date-and-time-string 
   #:parse-date-and-time-string
   #:parse-date-and-time 
   #:print-brief-ut 
   #:print-ut
   #:print-time-interval 
   #:print-brief-time-interval
   #:parse-interval-or-never
   
   #:+minutes-per-hour+
   #:+seconds-per-hour+
   #:+seconds-per-minute+
   #:+usual-days-per-year+
   #:+hours-per-day+
   #:+seconds-per-day+
   
   #:format-date
   #:days-in-month
   #:day-of-year
   #:leap-year-p)
    
  ;; strings
  (:export 
   #:string-before
   #:string-after
   #:string-contains-p
   #:string->symbol
   #:symbol->string
   #:substring
   #:tokenize-string
   #:list->formatted-string)
  
  ;; sequences
  (:export 
   #:reduce-if
   #:minimize
   
   #:dotted-pair-p
   
   #:flatten
   #:power-set
   #:all-pairs
   #:map-combinations
   #:combinations
   #:remove-members
   #:permute
   
   #:transpose
   #:transpose2
   #:iterate-over-indexes
   
   #:form-symbol-in-package
   #:form-symbol
   #:form-keyword
   #:form-uninterned-symbol
   
   #:current-load-file
   #:with-unique-names
   
   #:ensure-list 
   #:newsym
   #:export-exported-symbols
   
   #:length-at-most-p
   #:length-at-least-p
   #:length-1-list-p
   
   #:nearly-zero-p
   #:nearly-equal-p
   
   #:samep
   #:nearly-samep
   #:*samep-test*
   #:reset
   
   #:set-equal
   
   #:is-interface-available-p
   #:is-default-interface-available-p
   #:default-interface
   
   #:quit-lisp
   #:quit-lisp*
   
   #:inspect-thing*
   #:inspect-thing
   #:inspect-things
   
   #:total-bytes-allocated*
   #:total-bytes-allocated
   
   #:gc-time
   
   #:collect-garbage*
   #:collect-garbage
   
   #:make-load-form*
   
   #:*development-mode* 
   #:*use-native-debugger*
   
   #:with-progress-bar 
   #:progress
   #:make-progress-bar
   #:progress-bar-value
   #:close-progress-bar
   #:with-process-message
   #:handle-errors
   #:gui-error
   #:gui-warn
   #:interface-beep
   #:sound-note
   #:stop-notes
   #:select-instrument
   #:make-color*
   #:make-scaled-color
   #:make-gray
   #:y-or-n-question
   #:choose-file-question
   #:choose-new-file-question
   #:choose-directory-question
   #:choose-item-question
   #:query-user-for-string
   #:query-user-for-integer
   #:choose-item-from-pup
   #:choose-item-from-pup-no-singletons
   #:make-ui-point*
   #:process-parameters
   #:put-item-on-clipboard
   #:inspect-thing
   #:inspect-things
   #:prompt-for
   
   #:parse-brief-slot
   #:class-copyable-p)
  
  (:export
   #:length-at-least-p
   #:length-at-most-p
   #:length-exactly-p
   #:same-length-p
   #:percent-overlap)

  (:export
   #:tree-search)

  ;; l0-strings
  (:export
   #:+whitespace-characters+
   #:whitespacep
   #:string-starts-with
   #:string-ends-with
   #:string-trim-if
   #:strip-whitespace))


