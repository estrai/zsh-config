# default

path=(
	$HOME/bin
	/usr/local/bin
	/usr/local/sbin
	/usr/bin
	/usr/sbin
	/bin
	/sbin
	/usr/X11/bin

	$PATH

	$HOME/.rbenv/bin
)

if [[ $HOST =~ '^lizak' ]]; then
	path=(
		/usr/local/zsh/bin # where my custom zsh lives
		/opt/local/bin     # macports
		/opt/local/sbin    # macports
		/sw/bin            # fink
		/Applications/MacVim.app/Contents/MacOS
		$HOME/perl5/perlbrew/etc/cshrc

		$PATH
	)
fi

export PATH
export EDITOR=vim

eval "$(rbenv init -)"
