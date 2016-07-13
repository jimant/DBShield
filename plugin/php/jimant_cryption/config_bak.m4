dnl $Id$
dnl config.m4 for extension jimant_cryption

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

PHP_ARG_WITH(jimant_cryption, for jimant_cryption support,
dnl Make sure that the comment is aligned:
[  --with-jimant_cryption             Include jimant_cryption support])

dnl Otherwise use enable:

dnl PHP_ARG_ENABLE(jimant_cryption, whether to enable jimant_cryption support,
dnl Make sure that the comment is aligned:
dnl [  --enable-jimant_cryption           Enable jimant_cryption support])

if test "$PHP_JIMANT_CRYPTION" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-jimant_cryption -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/jimant_cryption.h"  # you most likely want to change this
  dnl if test -r $PHP_JIMANT_CRYPTION/$SEARCH_FOR; then # path given as parameter
  dnl   JIMANT_CRYPTION_DIR=$PHP_JIMANT_CRYPTION
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for jimant_cryption files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       JIMANT_CRYPTION_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$JIMANT_CRYPTION_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the jimant_cryption distribution])
  dnl fi

  dnl # --with-jimant_cryption -> add include path
  dnl PHP_ADD_INCLUDE($JIMANT_CRYPTION_DIR/include)

  dnl # --with-jimant_cryption -> check for lib and symbol presence
  dnl LIBNAME=jimant_cryption # you may want to change this
  dnl LIBSYMBOL=jimant_cryption # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $JIMANT_CRYPTION_DIR/lib, JIMANT_CRYPTION_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_JIMANT_CRYPTIONLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong jimant_cryption lib version or lib not found])
  dnl ],[
  dnl   -L$JIMANT_CRYPTION_DIR/lib -lm
  dnl ])
  dnl
  dnl PHP_SUBST(JIMANT_CRYPTION_SHARED_LIBADD)

  PHP_ADD_INCLUDE(/usr/include)

  LIB_GPGERROR=gpg-error
  LIB_GCRYPT=gcrypt
  LIB_JIMANT=jimant_php_cryption

  PHP_CHECK_LIBRARY($LIB_GPGERROR, $LIB_GPGERROR,
  [
    PHP_ADD_LIBRARY_WITH_PATH($LIB_GPGERROR, /usr/lib64, LIBGPGERROR_SHARED_LIBADD)
    AC_DEFINE(HAVE_GPGERRORLIB, 1, [ ])
  ],[
    AC_MSG_ERROR([wrong gpg-error lib version or lib not found])
  ],[
    -L/usr/lib64 -lm
  ])
  
  PHP_CHECK_LIBRARY($LIB_GCRYPT, $LIB_GCRYPT,
  [
    PHP_ADD_LIBRARY_WITH_PATH($LIB_GCRYPT, /usr/lib64, LIBGCRYPT_SHARED_LIBADD)
    AC_DEFINE(HAVE_GCRYPTLIB, 1, [ ])
  ],[
    AC_MSG_ERROR([wrong gcrypt lib version or lib not found])
  ],[
    -L/usr/lib64 -lm
  ])

  dnl jimant
  PHP_CHECK_LIBRARY($LIB_JIMANT, $LIB_JIMANT,
  [
    PHP_ADD_LIBRARY_WITH_PATH($LIB_JIMANT, /usr/lib64/jimant, LIBJIMANT_SHARED_LIBADD)
    AC_DEFINE(HAVE_JIMANTLIB, 1, [ ])
  ],[
    AC_MSG_ERROR([wrong jimant lib version or lib not found])
  ],[
    -L/usr/lib64/jimant -lm
  ])

  PHP_SUBST(LIBGPGERROR_SHARED_LIBADD)
  PHP_SUBST(LIBGCRYPT_SHARED_LIBADD)
  PHP_SUBST(LIBJIMANT_SHARED_LIBADD)


dnl  PHP_ADD_LIBRARY_WITH_PATH(gpg-error, /usr/lib64, LIBGPGERROR_SHARED_LIBADD)
dnl  PHP_ADD_LIBRARY_WITH_PATH(gcrypt, /usr/lib64, LIBGCRYPT_SHARED_LIBADD)
dnl  PHP_ADD_LIBRARY_WITH_PATH(jimant_php_cryption, /usr/lib64/jimant, LIBJIMANT_SHARED_LIBADD)

  PHP_NEW_EXTENSION(jimant_cryption, jimant_cryption.c, $ext_shared)
fi
