(defpackage :mocp
	(:documentation "Controls Media On Console Player.")
	(:use
		:common-lisp
		#+SBCL :sb-ext
		#+CMU :extensions
		#+CLISP :ext
		#+ECL :si)
	(:export
		:*mocp*
		:start
		:stop
		:play
		:pause
		:next
		:previous
		:seek)
	(:size 8))
(in-package :mocp)

#+(or SBCL CMU CLISP ECL) (pushnew :mocp common-lisp:*features*)
#+GCL (pushnew :mocp lisp:*features*)

(defparameter *socket-name* "socket2")

(defparameter *mocp* "/usr/bin/mocp" "Path to Media On Console Player.")

(defun start ()
	"Start MOC server"
	(or
		#+SBCL (sb-ext:run-program *mocp* '("-S"))
		#+CMU (extensions:run-program *mocp* '("-S"))
		#+CLISP (ext:execute *mocp* "-S")
		#+ECL (si:run-program *mocp* '("-S"))
		(error "Function not implemented.")))

(defun stop ()
	"Stop MOC server"
	(or
		#+SBCL (sb-ext:run-program *mocp* '("-x"))
		#+CMU (extensions:run-program *mocp* '("-x"))
		#+CLISP (ext:execute *mocp* "-x")
		#+ECL (si:run-program *mocp* '("-x"))
		(error "Function not implemented.")))

(defun play ()
	"Start playing files"
	(or
		#+SBCL (sb-ext:run-program *mocp* '("-p"))
		#+CMU (extensions:run-program *mocp* '("-p"))
		#+CLISP (ext:execute *mocp* "-p")
		#+ECL (si:run-program *mocp* '("-p"))
		(error "Function not implemented.")))

(defun pause ()
	"Start/stop playing"
	(or
		#+SBCL (sb-ext:run-program *mocp* '("-G"))
		#+CMU (extensions:run-program '("-G"))
		#+CLISP (ext:execute *mocp* "-G")
		#+ECL (si:run-program '("-G"))
		(error "Function not implemented.")))

(defun next ()
	"Choose next song in playlist"
	(or
		#+SBCL (sb-ext:run-program *mocp* '("-f"))
		#+CMU (extensions:run-program '("-f"))
		#+CLISP (ext:execute *mocp* "-f")
		#+ECL (si:run-program '("-f"))
		(error "Function not implemented.")))

(defun previous ()
	"Choose previous song in playlist"
	(or
		#+SBCL (sb-ext:run-program *mocp* '("-r"))
		#+CMU (extensions:run-program *mocp* '("-r"))
		#+CLISP (ext:execute *mocp* "-r")
		#+ECL (si:run-program *mocp* '("-r"))
		(error "Function not implemented.")))

(defun seek (number)
	"Seek for N seconds"
	(or
		#+SBCL (sb-ext:run-program *mocp* '("-k" (format nil "~S" number)))
		#+CMU (extensions:run-program *mocp* '("-k" (format nil "~S" number)))
		#+CLISP (ext:execute *mocp* "-k" (format nil "~S" number))
		#+ECL (si:run-program *mocp* '("-k" (format nil "~S" number)))
		(error "Function not implemented.")))
