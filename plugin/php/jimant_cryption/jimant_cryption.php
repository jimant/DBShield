<?php
$br = (php_sapi_name() == "cli")? "":"<br>";

if(!extension_loaded('jimant_cryption')) {
	dl('jimant_cryption.' . PHP_SHLIB_SUFFIX);
}
$module = 'jimant_cryption';
$functions = get_extension_funcs($module);
echo "Functions available in the test extension:$br\n";
foreach($functions as $func) {
    echo $func."$br\n";
}
echo "$br\n";
//$function = 'encryptionPHP_Mysql';
$function = 'encryptionPHP_Oracle';
if (extension_loaded($module)) {
//	$str = "aa";
//	$str = $function('127.0.0.1', 'goodocy', '12', 'asd', 'CUSTOM_DB', 'MEMBER', 'MEMBER_ID');
	$str = $function('127.0.0.1', 'JIMANT', '12', 'asd','FO4STEST', 'ORCL', 'MYTABLE', 'IV_NONE');
} else {
	$str = "Module $module is not compiled into PHP";
}
echo "$str\n";
?>
