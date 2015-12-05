echo "Start logging. Press Ctrl+C to stop...";

echo=false

[ -n "$1" ] && command=$1

if [ "$command" = "echo" ]
  then
  echo=true
fi

until false;
	do 
		if $echo
		  then
		  echo -e "> \c"; read cmd;
		else
		  read -s cmd;
		fi
		len=${#cmd};
		message=""
		if [ $len != 0 ]; then
			lx-log $cmd;
			message="[Logged "${#cmd}" character(s).]";
		else
			message="[Null]";
		fi
		if [ "$echo" != true ]; then
			echo $message
		fi
done