if [[ $HOST =~ '^lizak' ]]; then
	path=(
		/usr/local/zsh/bin # where my custom zsh lives
		/opt/local/bin     # macports
		/opt/local/sbin    # macports
		/sw/bin            # fink
		/usr/local/bin
		/usr/bin
		/bin
		/usr/sbin
		/sbin
		/usr/X11/bin
		/Applications/MacVim.app/Contents/MacOS
		$HOME/perl5/perlbrew/etc/cshrc
		$PATH
	)
fi

# default

path=(
	$HOME/bin
	$PATH
)

export PATH
