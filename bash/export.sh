# Export Golang
export GOPATH=~/.go
export PATH=$PATH:$GOPATH/bin

# Export brew settings
export PATH=/usr/local/sbin:$PATH

# Export PHP 7.2
export PATH=/usr/local/opt/php@7.2/bin:$PATH
export PATH=/usr/local/opt/php@7.2/sbin:$PATH
export PATH=/usr/local/Cellar/php@7.2/7.2.22_1/bin:$PATH
export LDFLAGS="-L/usr/local/opt/php@7.2/lib"
export CPPFLAGS="-I/usr/local/opt/php@7.2/include"

# Export Laravel & Composer
export PATH=~/.config/composer/vendor/bin:$PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
