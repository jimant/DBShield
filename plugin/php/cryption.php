<?php
	function mysql_init($type, $user_data, &$user, &$user_ip, &$user_thread_id) {
		$user = NULL;
		$user_ip = NULL;
		$user_thread_id = NULL;

		if( $type == 0 ) {
			while($row = mysql_fetch_array($user_data)) {
				$split_datas = explode("@", $row['USER()']);
				$user = $split_datas[0];
				$user_ip = $split_datas[1];
				$user_thread_id = $row['CONNECTION_ID()'];
			}
		} else if( $type == 1 || $type == 2 ) {
			while($row = ($user_data->fetch_array())) {
				$split_datas = explode("@", $row['USER()']);
				$user = $split_datas[0];
				$user_ip = $split_datas[1];
				$user_thread_id = $row['CONNECTION_ID()'];
			}
		}
	}

	// Encryption Global Function
	function encryption($type, $conn, $data, $db_name, $table_name, $column_name) {
		if( strcmp($type, "mysql") == 0 ) {
			return encryptionMysql($conn, $data, $db_name, $table_name, $column_name);
		} else if( strcmp($type, "mysqli") == 0 ) {
			return encryptionMysqli($conn, $data, $db_name, $table_name, $column_name);
		} else if( strcmp($type, "mysqlnd") == 0 ) {
			return encryptionMysqlnd($conn, $data, $db_name, $table_name, $column_name);
		} else if( strcmp($type, "oracle") == 0 ) {
			//printf("Oracle\n");
			return encryptionOracle($conn, $data, $db_name, $table_name, $column_name);
		} else {
			printf("TYPE IS NULL@@\n");
			return NULL;
		}
	}

	function encryptionMysql($conn, $data, $db_name, $table_name, $column_name) {
		if( $conn == NULL )
			return NULL;

		$user_data = mysql_query("SELECT USER(), CONNECTION_ID()");

		mysql_init(0, $user_data, $user, $user_ip, $user_thread_id);

		if( $user_data )
			mysql_free_result($user_data);

		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 )
			$user_ip = "127.0.0.1";
		return encryptionPHP_Mysql($user_ip, $user, $user_thread_id, $data, $db_name, $table_name, $column_name);
	}

	function encryptionMysqli($conn, $data, $db_name, $table_name, $column_name) {
		if( $conn == NULL )
			return NULL;

		$user_data = $conn->query("SELECT USER(), CONNECTION_ID()");

		mysql_init(1, $user_data, $user, $user_ip, $user_thread_id);

		if( $user_data )
			$user_data->free();

		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 )
			$user_ip = "127.0.0.1";

		return encryptionPHP_Mysql($user_ip, $user, $user_thread_id, $data, $db_name, $table_name, $column_name);
	}

	function encryptionMysqlnd($conn, $data, $db_name, $table_name, $column_name) {
		if( $conn == NULL )
			return NULL;

		$user_data = $conn->query("SELECT USER(), CONNECTION_ID()");

		mysql_init(2, $user_data, $user, $user_ip, $user_thread_id);

		if( $user_data )
			$user_data->free();

		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 )
			$user_ip = "127.0.0.1";

		return encryptionPHP_Mysql($user_ip, $user, $user_thread_id, $data, $db_name, $table_name, $column_name);
		// return $user . "\t" . $user_ip . "\t" . $user_thread_id;
	}

	function encryptionOracle($conn, $data, $db_name, $table_name, $column_name) {
		//printf("encryptionOracle\n");
		if( $conn == NULL )
			return NULL;

		$user = NULL;
		$user_ip = NULL;
		$user_session_id = NULL;
		$user_program_name = NULL;

		//printf("Oracle Begin\n");

		$user_data = oci_parse($conn, "SELECT SYS_CONTEXT ( 'USERENV', 'SESSION_USER') dbUser, 
			SYS_CONTEXT ( 'USERENV', 'IP_ADDRESS') IP, 
			SYS_CONTEXT ( 'USERENV',  'MODULE') programName,
			SYS_CONTEXT ( 'USERENV', 'SESSIONID') sessionID FROM DUAL");
		oci_execute($user_data);
		while($row = oci_fetch_array($user_data, OCI_BOTH+OCI_RETURN_NULLS)) {
			$user = $row['DBUSER'];
			$user_ip = $row['IP'];
			$user_program_name = $row['PROGRAMNAME'];
			$user_session_id = $row['SESSIONID'];
		}

		if( $user_data )
			oci_free_statement($user_data);
		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 || strcmp($user_ip, 'LOCALHOST') == 0 )
			$user_ip = "127.0.0.1";

		return encryptionPHP_Oracle($user_ip, $user, $user_session_id, $user_program_name, $data, $db_name, $table_name, $column_name);
	}

	// Decryption Global Function
	function decryption($type, $conn, $data, $db_name, $table_name, $column_name) {
		if( strcmp($type, "mysql") == 0 ) {
			return decryptionMysql($conn, $data, $db_name, $table_name, $column_name);
		} else if( strcmp($type, "mysqli") == 0 ) {
			return decryptionMysqli($conn, $data, $db_name, $table_name, $column_name);
		} else if( strcmp($type, "mysqlnd") == 0 ) {
			return decryptionMysqlnd($conn, $data, $db_name, $table_name, $column_name);
		} else if( strcmp($type, "oracle") == 0 ) {
			return decryptionOracle($conn, $data, $db_name, $table_name, $column_name);
		} else {
			return NULL;
		}
	}

	function decryptionMysql($conn, $data, $db_name, $table_name, $column_name) {
		if( $conn == NULL )
			return NULL;

		$user_data = mysql_query("SELECT USER(), CONNECTION_ID()");

		mysql_init(0, $user_data, $user, $user_ip, $user_thread_id);

		if( $user_data )
			mysql_free_result($user_data);

		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 )
			$user_ip = "127.0.0.1";

		return decryptionPHP_Mysql($user_ip, $user, $user_thread_id, $data, $db_name, $table_name, $column_name);
	}

	function decryptionMysqli($conn, $data, $db_name, $table_name, $column_name) {
		if( $conn == NULL )
			return NULL;

		$user_data = $conn->query("SELECT USER(), CONNECTION_ID()");

		mysql_init(1, $user_data, $user, $user_ip, $user_thread_id);

		if( $user_data )
			$user_data->free();

		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 )
			$user_ip = "127.0.0.1";

		return decryptionPHP_Mysql($user_ip, $user, $user_thread_id, $data, $db_name, $table_name, $column_name);
	}

	function decryptionMysqlnd($conn, $data, $db_name, $table_name, $column_name) {
		if( $conn == NULL )
			return NULL;

		$user_data = $conn->query("SELECT USER(), CONNECTION_ID()");

		mysql_init(2, $user_data, $user, $user_ip, $user_thread_id);

		if( $user_data )
			$user_data->free();

		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 )
			$user_ip = "127.0.0.1";

		return decryptionPHP_Mysql($user_ip, $user, $user_thread_id, $data, $db_name, $table_name, $column_name);
	}

	function decryptionOracle($conn, $data, $db_name, $table_name, $column_name) {
		if( $conn == NULL )
			return NULL;

		$user = NULL;
		$user_ip = NULL;
		$user_session_id = NULL;
		$user_program_name = NULL;

		$user_data = oci_parse($conn, "SELECT SYS_CONTEXT ( 'USERENV', 'SESSION_USER') dbUser, 
			SYS_CONTEXT ( 'USERENV', 'IP_ADDRESS') IP, 
			SYS_CONTEXT ( 'USERENV',  'MODULE') programName,
			SYS_CONTEXT ( 'USERENV', 'SESSIONID') sessionID FROM DUAL");
		oci_execute($user_data);
		while($row = oci_fetch_array($user_data, OCI_BOTH+OCI_RETURN_NULLS)) {
			$user = $row['DBUSER'];
			$user_ip = $row['IP'];
			$user_program_name = $row['PROGRAMNAME'];
			$user_session_id = $row['SESSIONID'];
		}

		if( $user_data )
			oci_free_statement($user_data);

		if( $user == NULL || $user_ip == NULL )
			return NULL;

		if( strcmp($user_ip, 'localhost') == 0 || strcmp($user_ip, 'LOCALHOST') == 0 )
			$user_ip = "127.0.0.1";

		return decryptionPHP_Oracle($user_ip, $user, $user_session_id, $user_program_name, $data, $db_name, $table_name, $column_name);

		printf("\n\n");
	}
?>
