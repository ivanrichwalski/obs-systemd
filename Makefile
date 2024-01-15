BIN = ${HOME}/bin
SYSTEMD = ${HOME}/.config/systemd/user

all: install

bins = obs-launch obs-shutdown scene-switcher
units = obs-stream-start.service obs-stream-start.timer \
	obs-stream-stop.service obs-stream-stop.timer

install-bin: ${bins}
	@install -Cv -t ${BIN} $?

install-unit: ${units}
	@install -Cv -m 644 -t ${SYSTEMD} $?

reload:
	systemctl --user daemon-reload

install: install-bin install-unit
	@echo "Ok"
