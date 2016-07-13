/*
  +----------------------------------------------------------------------+
  | PHP Version 5                                                        |
  +----------------------------------------------------------------------+
  | Copyright (c) 1997-2010 The PHP Group                                |
  +----------------------------------------------------------------------+
  | This source file is subject to version 3.01 of the PHP license,      |
  | that is bundled with this package in the file LICENSE, and is        |
  | available through the world-wide-web at the following url:           |
  | http://www.php.net/license/3_01.txt                                  |
  | If you did not receive a copy of the PHP license and are unable to   |
  | obtain it through the world-wide-web, please send a note to          |
  | license@php.net so we can mail you a copy immediately.               |
  +----------------------------------------------------------------------+
  | Author:                                                              |
  +----------------------------------------------------------------------+
*/

/* $Id: header 297205 2010-03-30 21:09:07Z johannes $ */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"
#include "php_jimant_cryption.h"

/* If you declare any globals in php_jimant_cryption.h uncomment this:
ZEND_DECLARE_MODULE_GLOBALS(jimant_cryption)
*/
#include <jimant/cryption/encryption.h>
#include <jimant/cryption/decryption.h>

/* True global resources - no need for thread safety here */
static int le_jimant_cryption;

/* {{{ jimant_cryption_functions[]
 *
 * Every user visible function must have an entry in jimant_cryption_functions[].
 */
const zend_function_entry jimant_cryption_functions[] = {
	PHP_FE(encryptionPHP_Mysql, NULL)
        PHP_FE(decryptionPHP_Mysql, NULL)
        PHP_FE(encryptionPHP_Oracle, NULL)
        PHP_FE(decryptionPHP_Oracle, NULL)
	{NULL, NULL, NULL}	/* Must be the last line in jimant_cryption_functions[] */
};
/* }}} */

/* {{{ jimant_cryption_module_entry
 */
zend_module_entry jimant_cryption_module_entry = {
#if ZEND_MODULE_API_NO >= 20010901
	STANDARD_MODULE_HEADER,
#endif
	"jimant_cryption",
	jimant_cryption_functions,
	PHP_MINIT(jimant_cryption),
	PHP_MSHUTDOWN(jimant_cryption),
	PHP_RINIT(jimant_cryption),		/* Replace with NULL if there's nothing to do at request start */
	PHP_RSHUTDOWN(jimant_cryption),	/* Replace with NULL if there's nothing to do at request end */
	PHP_MINFO(jimant_cryption),
#if ZEND_MODULE_API_NO >= 20010901
	"0.1", /* Replace with version number for your extension */
#endif
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_JIMANT_CRYPTION
ZEND_GET_MODULE(jimant_cryption)
#endif

/* {{{ PHP_INI
 */
/* Remove comments and fill if you need to have entries in php.ini
PHP_INI_BEGIN()
    STD_PHP_INI_ENTRY("jimant_cryption.global_value",      "42", PHP_INI_ALL, OnUpdateLong, global_value, zend_jimant_cryption_globals, jimant_cryption_globals)
    STD_PHP_INI_ENTRY("jimant_cryption.global_string", "foobar", PHP_INI_ALL, OnUpdateString, global_string, zend_jimant_cryption_globals, jimant_cryption_globals)
PHP_INI_END()
*/
/* }}} */

/* {{{ php_jimant_cryption_init_globals
 */
/* Uncomment this function if you have INI entries
static void php_jimant_cryption_init_globals(zend_jimant_cryption_globals *jimant_cryption_globals)
{
	jimant_cryption_globals->global_value = 0;
	jimant_cryption_globals->global_string = NULL;
}
*/
/* }}} */

/* {{{ PHP_MINIT_FUNCTION
 */
PHP_MINIT_FUNCTION(jimant_cryption)
{
	/* If you have INI entries, uncomment these lines 
	REGISTER_INI_ENTRIES();
	*/
	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MSHUTDOWN_FUNCTION
 */
PHP_MSHUTDOWN_FUNCTION(jimant_cryption)
{
	/* uncomment this line if you have INI entries
	UNREGISTER_INI_ENTRIES();
	*/
	return SUCCESS;
}
/* }}} */

/* Remove if there's nothing to do at request start */
/* {{{ PHP_RINIT_FUNCTION
 */
PHP_RINIT_FUNCTION(jimant_cryption)
{
	return SUCCESS;
}
/* }}} */

/* Remove if there's nothing to do at request end */
/* {{{ PHP_RSHUTDOWN_FUNCTION
 */
PHP_RSHUTDOWN_FUNCTION(jimant_cryption)
{
	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION
 */
PHP_MINFO_FUNCTION(jimant_cryption)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "jimant_cryption support", "enabled");
	php_info_print_table_end();

	/* Remove comments if you have entries in php.ini
	DISPLAY_INI_ENTRIES();
	*/
}
/* }}} */


/* Remove the following function when you have succesfully modified config.m4
   so that your module can be compiled into PHP, it exists only for testing
   purposes. */

/* Every user-visible function in PHP should document itself in the source */
/* {{{ proto string confirm_jimant_cryption_compiled(string arg)
   Return a string to confirm that the module is compiled in */

PHP_FUNCTION(encryptionPHP_Mysql)
{
        char* ip = NULL;
        int ip_len = 0;

        char* user = NULL;
        int user_len = 0;

        char* threadId = NULL;
        int threadId_len = 0;

        char* data = NULL;
        int data_len = 0;

        char* dbName = NULL;
        int dbName_len = 0;

        char* tableName = NULL;
        int tableName_len = 0;

        char* columnName = NULL;
        int columnName_len = 0;

        if( zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "sssssss",
                &ip, &ip_len,
                &user, &user_len,
                &threadId, &threadId_len,
                &data, &data_len,
                &dbName, &dbName_len,
                &tableName, &tableName_len,
                &columnName, &columnName_len) == FAILURE) {
                return;
        }

        char* result = NULL;
        int result_len = 0;
	// fo4s modified a line below
        //bool isSuccess = true;
        bool isSuccess = false;

        char* enc = encryption(ip, user, threadId, NULL, data, dbName, tableName, columnName, &isSuccess);

/* fo4s addied start*/
        if (isSuccess) {
           result_len = spprintf(&result, 0, enc);
        } else {
           result_len = spprintf(&result, 0,"ERROR-FO4S-0001");
        }
        free(enc);
/* fo4s addied end*/

/* fo4s commented for above addition
        result_len = spprintf(&result, 0, enc); 
*/

        RETURN_STRINGL(result, result_len, 0);
}

PHP_FUNCTION(decryptionPHP_Mysql)
{
        char* ip = NULL;
        int ip_len = 0;

        char* user = NULL;
        int user_len = 0;

        char* threadId = NULL;
        int threadId_len = 0;

        char* data = NULL;
        int data_len = 0;

        char* dbName = NULL;
        int dbName_len = 0;

        char* tableName = NULL;
        int tableName_len = 0;

        char* columnName = NULL;
        int columnName_len = 0;

        if( zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "sssssss",
                &ip, &ip_len,
                &user, &user_len,
                &threadId, &threadId_len,
                &data, &data_len,
                &dbName, &dbName_len,
                &tableName, &tableName_len,
                &columnName, &columnName_len) == FAILURE) {
                return;
        }
        char* result = NULL;
        int result_len = 0;

	// fo4s modified a line below
        //bool isSuccess = true;
        bool isSuccess = false;
        char* dec = decryption(ip, user, threadId, NULL, data, dbName, tableName, columnName, &isSuccess);

/* fo4s addied start*/
        if (isSuccess) {
          if( strcmp(data, dec) == 0 )
             result_len = spprintf(&result, 0,"ERROR-FO4S-0001");
          else
              result_len = spprintf(&result, 0, dec);
        } else {
           result_len = spprintf(&result, 0,"ERROR-FO4S-0001");
        }
        free(dec);
/* fo4s addied end*/

/* fo4s commented for above addition
        result_len = spprintf(&result, 0, dec);
*/

        RETURN_STRINGL(result, result_len, 0);
}

PHP_FUNCTION(encryptionPHP_Oracle)
{
        char* ip = NULL;
        int ip_len = 0;

        char* user = NULL;
        int user_len = 0;

        char* threadId = NULL;
        int threadId_len = 0;

        char* programName = NULL;
        int programName_len = 0;

        char* data = NULL;
        int data_len = 0;

        char* dbName = NULL;
        int dbName_len = 0;

        char* tableName = NULL;
        int tableName_len = 0;

        char* columnName = NULL;
        int columnName_len = 0;

        if( zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "ssssssss",
                &ip, &ip_len,
                &user, &user_len,
                &threadId, &threadId_len,
                &programName, &programName_len,
                &data, &data_len,
                &dbName, &dbName_len,
                &tableName, &tableName_len,
                &columnName, &columnName_len) == FAILURE) {
                return;
        }

        char* result = NULL;
        int result_len = 0;

	// fo4s modified a line below
        //bool isSuccess = true;
        bool isSuccess = false;

        char* enc = encryption(ip, user, threadId, programName, data, dbName, tableName, columnName, &isSuccess);

/* fo4s addied start*/
        if (isSuccess) {
           result_len = spprintf(&result, 0, enc);
        } else {
           result_len = spprintf(&result, 0,"ERROR-FO4S-0001");
        }
        free(enc);
/* fo4s addied end*/
/* fo4s commented for above addition
        result_len = spprintf(&result, 0, enc);
*/
        RETURN_STRINGL(result, result_len, 0);
}

PHP_FUNCTION(decryptionPHP_Oracle)
{
        char* ip = NULL;
        int ip_len = 0;

        char* user = NULL;
        int user_len = 0;

        char* threadId = NULL;
        int threadId_len = 0;

        char* programName = NULL;
        int programName_len = 0;

        char* data = NULL;
        int data_len = 0;

        char* dbName = NULL;
        int dbName_len = 0;

        char* tableName = NULL;
        int tableName_len = 0;

        char* columnName = NULL;
        int columnName_len = 0;

        if( zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "ssssssss",
                &ip, &ip_len,
                &user, &user_len,
                &threadId, &threadId_len,
                &programName, &programName_len,
                &data, &data_len,
                &dbName, &dbName_len,
                &tableName, &tableName_len,
                &columnName, &columnName_len) == FAILURE) {
                return;
        }

        char* result = NULL;
        int result_len = 0;

	// fo4s modified a line below
        //bool isSuccess = true;
        bool isSuccess = false;

        char* dec = decryption(ip, user, threadId, programName, data, dbName, tableName, columnName, &isSuccess);

/* fo4s addied start*/
        if (isSuccess) {
          if( strcmp(data, dec) == 0 )
           	result_len = spprintf(&result, 0,"ERROR-FO4S-0001");
          else
           	result_len = spprintf(&result, 0, dec);
        } else {
           result_len = spprintf(&result, 0,"ERROR-FO4S-0001");
        }
        free(dec);
/* fo4s addied end*/
/* fo4s commented for above addition
        result_len = spprintf(&result, 0, dec);
        //free(dec);
*/
        RETURN_STRINGL(result, result_len, 0);
}

/* }}} */
/* The previous line is meant for vim and emacs, so it can correctly fold and 
   unfold functions in source code. See the corresponding marks just before 
   function definition, where the functions purpose is also documented. Please 
   follow this convention for the convenience of others editing your code.
*/


/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: noet sw=4 ts=4 fdm=marker
 * vim<600: noet sw=4 ts=4
 */
