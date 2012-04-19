if [[ $HOST =~ '^lizak' ]]; then
	path=(
		/usr/bin
		/bin
		/usr/sbin
		/sbin
		/usr/local/bin
		/usr/X11/bin
		/sw/bin
		$HOME/bin
		/opt/local/bin
		/opt/local/sbin
		/Applications/MacVim.app/Contents/MacOS
		$HOME/perl5/perlbrew/etc/cshrc
		$PATH
	)
fi

export PATH
